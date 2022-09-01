param( [String]$monitorIP = "0.0.0.0", [String]$ScanIP="all", [String]$Protocol = "all", `
		[String]$Port="all", [Int]$Seconds = 0, [switch]$ResolveHosts, [switch]$Help )

# CONFIGURABLE PARAMETERS
$validMAC = "0.0.0.0"
#########################

# Requires Administrative Permissions (for ARP cache entry deletion); test and relaunch requesting elevation if necessary
If (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{   
    "Not running with elevated permissions. Relaunching..."
    $arguments = "-ExecutionPolicy RemoteSigned & '" + $myinvocation.mycommand.definition + "'"
    Start-Process powershell  -Verb runAs -ArgumentList $arguments
    Break
}

$iteration = 1
while($true)
{    
    if($iteration % 12 -eq 1) #every 60 seconds-ish, force ARP request to detect passive ARP poisoning
    {
        Write-Output "Deleting ARP entry and attempting ping to detect passive ARP poisoning."
        arp -d $monitorIP | Out-Null
        ping -n 1 $monitorIP | Out-Null
    }
    $date = (get-date -format "yyyy-MM-dd HH:mm:ss")
    $neighbors = (netsh interface ipv4 show neighbors)
    $cmd = ($neighbors | Select-String $monitorIP).ToString()
    $outline = $date + ": " + $cmd
    #Write-Output $outline
    if($logFile -ne $null)
    {
        $outline | Add-Content $logFile
    }
    if(($outline -notmatch $validMAC) -and ($outline -notmatch "00-00-00-00-00-00")) # Poisoned
    {
        $mac = $cmd.replace($monitorIP,"").replace(" ","").substring(0,17)
        $otherIP = ($neighbors | Select-String $mac)
        $otherIP = $otherIP | Where-Object {$_ -notmatch $monitorIP}
        #Write-Warning $outline
        if($otherIP -eq $null) # no other IP found
        {
            $outtxt = $date + ": " + $monitorIP + " poisoned by " + $mac + ". (No other known IP)"
        }
        elseif($otherIP.GetType().Name -eq "MatchInfo") # one IP found; likely real
        {
            $outtxt = $date + ": " + $monitorIP + " poisoned by " + $mac + ". (Probable IP: " + $($otherIP.ToString().substring(0,15).Trim()) + ")"
        }
        else # multiple other IPs ($otherIP is an array which requires iterating through)
        {
            $ips = ""
            for($i=0; $i -lt $otherIP.count; $i++)
            {
                $ips += $($otherIP[$i].ToString().substring(0,15).Trim())
                if($i -lt $otherIP.count-1)
                {
                    $ips += ", "
                }
            }
            $outtxt = $date + ": " + $monitorIP + " poisoned by " + $mac + ". (Possible real IPs: " + $ips + ")"
        }
        Write-Warning $outtxt
    }
    Start-Sleep -Seconds 5
    $iteration++
}
