@echo off

cls

title "DuckSploit - hacker's setup"

REM VERIFYING BAT WAS RUN AS ADMIN
net session > nul 2>&1
if /i not %errorlevel%==0 (
  echo You need to run this script as Admin.
  pause
  goto:eof
)

cls


color 0e

set current_dir=%~dp0
set server_dir=%current_dir%
set root_dir=%server_dir:hacker=%

echo currentdir: %current_dir%
echo server_dir: %server_dir%
echo rootdir: %root_dir%

pause

echo %server_dir%
cd %server_dir%




mkdir C:\DuckSploit
Xcopy %root_dir%\hacker C:\DuckSploit /E /H /C /I /q /Y
for /f %%i in (C:\DuckSploit\version.txt) do SET version=%%i


echo.
echo.
echo [+] Installing Menu Shortcut...

cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
mkdir Ducksploit
cd %server_dir%
copy "%server_dir%\Ducksploit - Docs.Lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "%server_dir%\DuckpvpTeam.Lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "%server_dir%\DuckSploit.Lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"


echo.


powershell %server_dir%/setup-notif.ps1



echo.
echo [+] Installing Ducksploit v.%version% ...

@echo on
copy "%server_dir%\ds.bat" "C:\Windows\System32"
pause
echo [o] Ducksploit command version '%version%' configured!
@echo off


pause

echo.
echo [o] Finished!
pause



color F

exit
