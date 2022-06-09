$address="Any"
$port=53

Cls

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
# Wait
Write-Host "    [" -fore yellow -NoNewline;
Write-Host "1" -fore red -NoNewline;
Write-Host "] Wait" -fore yellow;
# Open chat
Write-Host "    [" -fore yellow -NoNewline;
Write-Host "2" -fore red -NoNewline;
Write-Host "] Open chat" -fore yellow;
# Visit website
Write-Host "    [" -fore yellow -NoNewline;
Write-Host "3" -fore red -NoNewline;
Write-Host "] Visit our website" -fore yellow;
# Exit
Write-Host "    [" -fore yellow -NoNewline;
Write-Host "4" -fore red -NoNewline;
Write-Host "] Exit" -fore yellow;
Write-Host " "

Write-Host "Choose option [" -fore green -NoNewline;
Write-Host "1" -fore yellow -NoNewline;
Write-Host "," -fore red -NoNewline;
Write-Host "2" -fore yellow -NoNewline;
Write-Host "," -fore red -NoNewline;
Write-Host "3" -fore yellow -NoNewline;
Write-Host "," -fore red -NoNewline;
Write-Host "4" -fore yellow -NoNewline;
Write-Host "]: " -fore green -NoNewline;
$menu = Read-Host

if( $menu -eq "1" )
{
    try{
		$endpoint = new-object System.Net.IPEndPoint( [IPAddress]::$address, $port )
		$udpclient = new-object System.Net.Sockets.UdpClient $port
	}
	catch{
		throw $_
		exit -1
	}

	Write-Host "Waiting for connection..." -fore yellow
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
			Write-Host "DS> " -fore green -NoNewline;
			$input = Read-Host
			$EndPoints2 = New-Object System.Net.IPEndPoint([IPAddress]::$address, $port) 
			$EncodedText = [Text.Encoding]::ASCII.GetBytes($input) 
			$SendMessage = $udpclient.Send($EncodedText, $EncodedText.Length, $EndPoints2) 
			
			
			$content = $udpclient.Receive( [ref]$endpoint )
			Write-Host "$($endpoint.Address.IPAddressToString):$($endpoint.Port) $([Text.Encoding]::ASCII.GetString($content))"
		}
	}

	$udpclient.Close( )
}
elseif( $menu -eq "2" )
{
	
}
elseif( $menu -eq "3" )
{
	Start-Process "https://canarddu38.github.io/DUCKSPLOIT"
}
elseif( $menu -eq "4" )
{
	Cls
	Write-Host "[" -fore yellow -NoNewline; 
	Write-Host "o" -fore red -NoNewline; 
	Write-Host "]" -fore yellow -NoNewline;
	Write-Host " Successfully exited from DuckSploit!" -fore green
	Exit
}
else
{
	Write-Host "Incorrect awnser (only 1,2,3 or 4 are accepted)!" -fore red
}
