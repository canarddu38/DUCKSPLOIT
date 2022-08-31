[CmdletBinding()]
param(
    [Parameter(Position = 0, Mandatory = $true)]
    [string]$ComputerName,

    [Parameter(Position = 1, ParameterSetName = 'PortRange')]
    [ValidateRange(1, 65535)]
    [int]$StartPort = 1,

    [Parameter(Position = 2, ParameterSetName = 'PortRange')]
    [ValidateRange(1, 65535)]
    [ValidateScript( {
            if ($_ -lt $StartPort)
            {
                Write-Error 'The EndPort cannot be lower than the StartPort'
            }
            else 
            {
                return $true
            }
        })]
    [int]$EndPort = 65535,
    
    [Parameter(Position = 2, ParameterSetName = 'Port')]
    [string[]]$Port,
    
    [int]$Threads = 500,

    [switch]$Force
)

begin
{
    function Test-Port
    {  
        [Cmdletbinding()]
        Param(  
            [Parameter(Mandatory, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
            [string[]]$ComputerName,

            [Parameter(Mandatory, Position = 1, ValueFromPipelineByPropertyName)]
            [int]$Port,

            [int]$Count = 1,

            [int]$Delay = 500,
        
            [int]$TcpTimeout = 1000,
            [int]$UdpTimeout = 1000,
            [switch]$Tcp,
            [switch]$Udp
        )

        begin
        {  
            if (-not $Tcp -and -not $Udp)
            {
                $Tcp = $true
            }
            #Typically you never do this, but in this case I felt it was for the benefit of the function  
            #as any errors will be noted in the output of the report          
            $ErrorActionPreference = 'SilentlyContinue'
            $report = @()

            $sw = New-Object System.Diagnostics.Stopwatch
        }

        process
        {
            foreach ($c in $ComputerName)
            {
                for ($i = 0; $i -lt $Count; $i++) 
                {
                    $result = New-Object PSObject | Select-Object Server, Port, TypePort, Open, Notes, ResponseTime
                    $result.Server = $c
                    $result.Port = $Port
                    $result.TypePort = 'TCP'

                    if ($Tcp)
                    {
                        $tcpClient = New-Object System.Net.Sockets.TcpClient
                        $sw.Start()
                        $connect = $tcpClient.BeginConnect($c, $Port, $null, $null)
                        $wait = $connect.AsyncWaitHandle.WaitOne($TcpTimeout, $false)
                    
                        if (-not $wait)
                        {
                            $tcpClient.Close()
                            $sw.Stop()
                            Write-Verbose 'Connection Timeout'

                            $result.Open = $false
                            $result.Notes = 'Connection to Port Timed Out'
                            $result.ResponseTime = $sw.ElapsedMilliseconds
                        }
                        else
                        {
                            [void]$tcpClient.EndConnect($connect)
                            $tcpClient.Dispose()
                            $sw.Stop()
                            $result.Open = $true
                        }

                        $result.ResponseTime = $sw.ElapsedMilliseconds
                    }
                    if ($Udp)
                    {
                        $udpClient = New-Object System.Net.Sockets.UdpClient
                        $udpClient.Client.ReceiveTimeout = $UdpTimeout

                        $a = New-Object System.Text.ASCIIEncoding
                        $byte = $a.GetBytes("$(Get-Date)")

                        $result.Server = $c
                        $result.Port = $Port
                        $result.TypePort = 'UDP'

                        Write-Verbose 'Making UDP connection to remote server'
                        $sw.Start()
                        $udpClient.Connect($c, $Port)
                        Write-Verbose 'Sending message to remote host'
                        [void]$udpClient.Send($byte, $byte.Length)
                        Write-Verbose 'Creating remote endpoint'
                        $remoteEndpoint = New-Object System.Net.IPEndPoint([System.Net.IPAddress]::Any, 0)

                        try
                        {
                            Write-Verbose 'Waiting for message return'
                            $receiveBytes = $udpClient.Receive([ref]$remoteEndpoint)
                            $sw.Stop()
                            [string]$returnedData = $a.GetString($receiveBytes)
                        
                            Write-Verbose 'Connection Successful'
                            
                            $result.Open = $true
                            $result.Notes = $returnedData
                        }
                        catch
                        {
                            Write-Verbose 'Host maybe unavailable'
                            $result.Open = $false
                            $result.Notes = 'Unable to verify if port is open or if host is unavailable.'
                        }
                        finally
                        {
                            $udpClient.Dispose()
                            $result.ResponseTime = $sw.ElapsedMilliseconds
                        }
                    }

                    $sw.Reset()
                    $report += $result

                    Start-Sleep -Milliseconds $Delay
                }
            }
        }

        end
        {
            $report 
        }
    }

    Write-Verbose -Message "Script started at $(Get-Date)"

    $portListPath = "$PSScriptRoot\Ports.txt"
    $formatPath = "$PSScriptRoot\PortTest.format.ps1xml"
    
    if (Test-Path -Path $portListPath -PathType Leaf)
    {        
        $portsHashTable = @{ }
        $ports = Import-Csv -Path $portListPath -Delimiter '|' -Header 'Port', 'Protocol', 'ServiceName', 'ServiceDescription' | Where-Object Protocol -eq tcp

        foreach ($item in $ports)
        {
            try
            {
                $portsHashTable.Add($item.Port, ("{0}|{1}" -f $item.ServiceName, $item.ServiceDescription))
            }
            catch
            { 
            }
        }
    }
    
    if (Test-Path -Path $formatPath)
    {
        Update-FormatData -PrependPath $formatPath
    }

    $assignServiceWithPort = $true
    $sb = (Get-Command -Name Test-Port).ScriptBlock
    
    $ports = if ($Port)
    {
        $Port
    }
    else
    {
        $StartPort..$EndPort
    }
    $portsToScan = $ports.Count
    
    $ports = foreach ($p in $ports)
    {
        [void]($p -match '(?<Port>\d{1,5})(?<Protocol>[ut]{1})?')
        $p = $Matches.Port
        
        if ($Matches.Protocol -eq 't')
        {
            $p | Add-Member -Name Protocol -MemberType NoteProperty -Value Tcp -PassThru
        }
        elseif ($Matches.Protocol -eq 'u')
        {
            $p | Add-Member -Name Protocol -MemberType NoteProperty -Value Udp -PassThru
        }
        else
        {
            $p | Add-Member -Name Protocol -MemberType NoteProperty -Value Tcp -PassThru
        }
    }
}

process
{

    Write-Verbose -Message "Test if host is reachable..."
    
    Write-Verbose -Message "Scanning range from $StartPort to $EndPort ($portsToScan Ports)"
    Write-Verbose -Message "Running with max $Threads threads"

    # Check if ComputerName is already an IPv4-Address, if not... try to resolve it
    $ipv4Address = $ComputerName -as [IPAddress]
	
    if (-not $ipv4Address)
    {
        # Get IP from Hostname (IPv4 only)
        try
        {
            $addressList = @(([System.Net.Dns]::GetHostEntry($ComputerName)).AddressList)
			
            foreach ($Address in $addressList)
            {
                if ($Address.AddressFamily -eq "InterNetwork") 
                {					
                    $ipv4Address = $Address.IPAddressToString 
                    break					
                }
            }					
        }
        catch
        { 
        }	# Can't get IPAddressList 					

        if (-not $ipv4Address)
        {
            throw "Could not get IPv4-Address for $ComputerName. Try to enter an IPv4-Address instead of the Hostname."
        }		
    }

    Write-Verbose -Message "Setting up RunspacePool..."

    $runspacePool = [System.Management.Automation.Runspaces.RunspaceFactory]::CreateRunspacePool(1, $Threads, $Host)
    $runspacePool.Open()
    [System.Collections.ArrayList]$jobs = @()

    Write-Verbose -Message "Setting up Jobs..."
    $i = 0
    
    #Set up job for each port
    foreach ($p in $ports)
    {
        $scriptParams = @{
            ComputerName = $ipv4Address
            Port         = $p
        }
        if ($p.Protocol -eq 'Tcp')
        {
            $scriptParams.Add('Tcp', $true)
        }
        else
        {
            $scriptParams.Add('Udp', $true)
        }

        # Catch when trying to divide through zero
        try
        {
            $progressPercent = $i / $portsToScan * 100
            $i++
        } 
        catch
        { 
            $progressPercent = 100 
        }

        Write-Progress -Activity "Setting up jobs..." -Id 1 -Status "Current Port: $p" -PercentComplete ($progressPercent)
        
        $job = [System.Management.Automation.PowerShell]::Create().AddScript($sb).AddParameters($scriptParams)
        $job.RunspacePool = $runspacePool
        
        $jobResult = [pscustomobject]@{
            RunNum = $p - $StartPort
            Pipe   = $job
            Result = $job.BeginInvoke()
        }

        # Add job to collection
        [void]$jobs.Add($jobResult)
    }

    Write-Verbose -Message "Waiting for jobs to complete & starting to process results..."

    # Total jobs to calculate percent complete, because jobs are removed after they are processed
    $jobsTotal = $jobs.Count

    # Process results, while waiting for other jobs
    Do
    {
        # Get all jobs, which are completed
        $jobsToProcess = $jobs | Where-Object { $_.Result.IsCompleted }
  
        # If no jobs finished yet, wait 500 ms and try again
        if (-not $jobsToProcess)
        {
            Write-Verbose -Message "No jobs completed, wait 500ms..."

            Start-Sleep -Milliseconds 500
            continue
        }
        
        # Get jobs, which are not complete yet
        $jobsRemaining = ($jobs | Where-Object { $_.Result.IsCompleted -eq $false }).Count

        # Catch when trying to divide through zero
        try
        {            
            $progressPercent = 100 - $jobsRemaining / $jobsTotal * 100
        }
        catch
        {
            $progressPercent = 100
        }

        Write-Progress -Activity "Waiting for jobs to complete... ($($Threads - $($runspacePool.GetAvailableRunspaces())) of $Threads threads running)" -Id 1 -PercentComplete $progressPercent -Status "$jobsRemaining remaining..."
      
        Write-Verbose -Message "Processing $(if($null -eq $jobsToProcess.Count){"1"}else{$jobsToProcess.Count}) job(s)..."

        # Processing completed jobs
        foreach ($job in $jobsToProcess)
        {       
            # Get the result...     
            $jobResult = $job.Pipe.EndInvoke($job.Result)
            $job.Pipe.Dispose()

            # Remove job from collection
            $jobs.Remove($job)
            
            $result = @{
                PSTypeName   = 'PortScanResult'
                ComputerName = $ComputerName
                IPV4Address  = $ipv4Address
                Port         = $jobResult.Port
                Protocol     = $jobResult.TypePort
                Status       = $jobResult.Open
            }
           
            if ($assignServiceWithPort)
            {
                $service = $portsHashTable."$($jobResult.Port)"
                if ($service)
                {
                    $service = $service.Split('|')
                    $result.Add('ServiceName', $Service[0])
                    $result.Add('ServiceDescription', $Service[1])
                }
            }
            
            if ($result.Status -or $PSCmdlet.ParameterSetName -eq 'Port')
            {
                $result.PSObject.TypeNames.Insert(0, "PortScanResult")
                [pscustomobject]$result
            }
        } 

    } While ($jobs.Count -gt 0)
    
    Write-Verbose -Message "Closing RunspacePool and free resources..."

    $runspacePool.Dispose()

    Write-Verbose -Message "Script finished at $(Get-Date)"
}

end
{

}