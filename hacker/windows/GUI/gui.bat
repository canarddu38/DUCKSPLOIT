@echo off

mkdir %userprofile%\DuckSploit\GUI


powershell (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/GUI/main.ps1', '%userprofile%\DuckSploit\GUI\main.ps1')
powershell (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/GUI/edit.ps1', '%userprofile%\DuckSploit\GUI\edit.ps1')
powershell (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/GUI/view.ps1', '%userprofile%\DuckSploit\GUI\view.ps1')
powershell (New-Object System.Net.WebClient).DownloadFile('https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/windows/GUI/add_victim.ps1', '%userprofile%\DuckSploit\GUI\add_victim.ps1')

mkdir "%programdata%\Microsoft\Windows\Start Menu\Programs\DuckSploit"

(
echo @echo off
echo REM DuckpvpTeam - 2022
echo powershell %userprofile%\DuckSploit\GUI\main.ps1 -WindowStyle Hidden
)>"%userprofile%\DuckSploit\GUI\start.bat"


powershell (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/blob/root/hacker/windows/GUI/DuckSploit%20-%20Manager.lnk?raw=true', '%programdata%\Microsoft\Windows\Start Menu\Programs\DuckSploit\DuckSploit - Manager.Lnk')

cls
echo Downloaded DuckSploit - Manager




pause
