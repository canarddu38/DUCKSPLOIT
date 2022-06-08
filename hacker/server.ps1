$address="Any"
$port=53


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
