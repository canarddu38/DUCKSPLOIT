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
del C:\DuckSPloit

set current_dir=%~dp0
set server_dir=%current_dir:\scripts=%
set root_dir=%server_dir:\copy=%

echo %server_dir%
cd %server_dir%


for /f %%i in (version.txt) do SET version=%%i

mkdir C:\DuckSploit
Xcopy %root_dir%\copy C:\DuckSploit /E /H /C /I /q

Xcopy %root_dir%\copy\scripts\startup\launch.bat C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup /E /H /C /I /q 

copy %root_dir%\scripts\client.bat C:\Users\Francois\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
pause



echo.
echo.
echo [+] Installing Menu Shortcut...

cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
mkdir Ducksploit
cd %server_dir%
copy "Ducksploit - Docs.cmd" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "DuckpvpTeam.cmd" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"



echo.



echo.
echo [+] Installing Ducksploit v.%version% ...

@echo on
copy "%server_dir%\ds.bat" "C:\Windows\System32"
copy "%server_dir%\scripts\wget.exe" "C:\Windows\System32"
pause
echo [o] Ducksploit command version '%version%' configured!
@echo off


pause

echo.
echo [o] Finished!
pause

color F