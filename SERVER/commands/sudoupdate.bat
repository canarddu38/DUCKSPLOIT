::move commands\*.* C:\Windows\System32
::copy commands\*.txt C:\Windows\System32
@echo off

for /f %%i in (C:\Users\%username%\path.txt) do SET root_dir=%%i



cls

color 0e

set current_dir=%~dp0
set server_dir=%root_dir%\SERVER

echo %server_dir%
cd %server_dir%

for /f %%i in (version.txt) do SET version=%%i


echo.
echo [+] Installing Menu Shortcut...

cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
mkdir Ducksploit
cd %server_dir%
copy ducksploit.bat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "Ducksploit - Docs.cmd" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "DuckpvpTeam.bat" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"




echo.
set /p result2="Install Ducksploit v.%version% ...? [y/n]"


echo.
echo [+] Installing Ducksploit v.%version% ...

@echo on
copy "%server_dir%\ducksploit.bat" "C:\Windows\System32"
pause
echo [o] Ducksploit command version '%version%' configured!
@echo off



mkdir C:\Users\%username%\DUCKSPLOIT
Xcopy %root_dir%\SERVER C:\Users\%username%\DUCKSPLOIT /E /H /C /I /q

echo [o] Commands are now ready to use!


echo.
echo [o] Updated!
pause

color A
