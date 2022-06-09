$address="Any"
$port=53


Write-Host " "
Write-Host "        dP                   dP                         dP          oo   dP   " -fore green
Write-Host "        88                   88                         88               88   " -fore green
Write-Host "  .d888b88 dP    dP .d8888b. 88  .dP  .d8888b. 88d888b. 88 .d8888b. dP d8888P " -fore green
Write-Host "  88'  '88 88    88 88'  `"`"  88888`"   Y8ooooo. 88'  '88 88 88'  '88 88   88   " -fore green
Write-Host "  88.  .88 88.  .88 88.  ... 88  '8b.       88 88.  .88 88 88.  .88 88   88   " -fore green
Write-Host "  '88888P8 '88888P' '88888P' dP   'YP '88888P' 88Y888P' dP '88888P' dP   dP   " -fore green
Write-Host "                                               88                              " -fore green
Write-Host "                                               dP                              " -fore green
Write-Host "                            | DuckSploit V1.0.8 |                         " -fore green
Write-Host ""
Write-Host "    [1] Wait" -fore yellow
Write-Host "    [2] Open chat"-fore yellow
Write-Host "    [3] Visit our website" -fore yellow
Write-Host "    [4] Exit" -fore yellow
Write-Host " "
$menu = Read-Host "Choose option [1,2,3,4]"

if( $menu -eq "1" )
{
    
}

















try{
	$endpoint = new-object System.Net.IPEndPoint( [IPAddress]::$address, $port )
	$udpclient = new-object System.Net.Sockets.UdpClient $port
}
catch{
	throw $_
	exit -1
}

Write-Host "Press ESC to stop the udp server ..." -fore yellow
Write-Host ""
while( $true )
{
	if( $host.ui.RawUi.KeyAvailable )
	{
		$key = $host.ui.RawUI.ReadKey( "NoEcho,IncludeKeyUp,IncludeKeyDown" )
		if( $key.VirtualKeyCode -eq 27 )
		{	break	}
	}

	if( $udpclient.Available )
	{
		Write-Host ""
		$input = Read-Host "DS> "
		
		$EndPoints2 = New-Object System.Net.IPEndPoint([IPAddress]::$address, $port) 
        $EncodedText = [Text.Encoding]::ASCII.GetBytes($input) 
		$SendMessage = $udpclient.Send($EncodedText, $EncodedText.Length, $EndPoints2) 
		
		
		$content = $udpclient.Receive( [ref]$endpoint )
		Write-Host "$($endpoint.Address.IPAddressToString):$($endpoint.Port) $([Text.Encoding]::ASCII.GetString($content))"
	}
}

$udpclient.Close( )
