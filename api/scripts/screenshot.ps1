Add-Type -AssemblyName System.Windows.Forms
$screen_cnt  = [System.Windows.Forms.Screen]::AllScreens.Count
$col_screens = [system.windows.forms.screen]::AllScreens
$info_screens = ($col_screens | ForEach-Object {
$width = "$($_.Bounds.Width)"
$height = "$($_.Bounds.Height)"
}
)


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
$date = Get-Date -Format "dddd_MM_dd_yyyy_HH_mm"
screenshot $bounds "$env:TEMP\\host\\host\\pannel\\screenshots\\screenshot_$date.jpg"
