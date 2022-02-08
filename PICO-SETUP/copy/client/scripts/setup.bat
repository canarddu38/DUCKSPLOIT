@echo off

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
set server_dir=%current_dir:\scripts=%
set root_dir=%server_dir:\client=%

echo %server_dir%
cd %server_dir%




mkdir C:\DuckSploit
Xcopy %root_dir%\client C:\DuckSploit /E /H /C /I /q
for /f %%i in (C:\DuckSploit\version.txt) do SET version=%%i

copy "%root_dir%\client\scripts\startup\launch.bat" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

pause



echo.
echo [+] Installing Ducksploit v.%version% ...

@echo on
copy "%server_dir%\ds.bat" "C:\Windows\System32"
pause
echo [o] Ducksploit command version '%version%' configured!
@echo off


pause

echo.
echo [o] Installation Finished!
pause
echo [~] Loading hosting component...
call %root_dir%\host\launch.bat %root_dir%
echo [o] finished!

color F