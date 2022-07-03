@echo off
REM DuckpvpTeam - 2022

set version=1.0.8
:menu
cls
set /p menu="Are you sure to install DuckSploit V%version%? (y/n) " 
if "%menu%"=="y" (goto start) else (
if "%menu%"=="n" (goto exit) else (

color 4
cls
echo [x] Bad awnser
color f
pause
goto menu
)
)
:exit
color f
cls
echo [o] Installation aborted
goto eof

:start
mkdir %USERPROFILE%\DuckSploit
cls
echo Downloading...

powershell (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/blob/root/hacker/windows/ds.exe?raw=true', '%USERPROFILE%\DuckSploit\ds.exe')
powershell (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/raw/root/images/icon.ico?raw=true', '%USERPROFILE%\DuckSploit\icon.ico')
powershell (New-Object System.Net.WebClient).DownloadFile('https://github.com/canarddu38/DUCKSPLOIT/raw/root/hacker/windows/GUI/gui.bat?raw=true', '%temp%\gui.bat')

(
echo @echo off
echo REM DuckpvpTeam - 2022
echo call %USERPROFILE%\DuckSploit\ds.exe
)>"%windir%\System32\ds.bat"

cls

call %temp%\gui.bat

echo DuckSploit V%version% is now downloaded
echo Type "ds" in your terminal to launch DuckSploit
