::move commands\*.* C:\Windows\System32
::copy commands\*.txt C:\Windows\System32
@echo off

cls

color 0e

set current_dir=%~dp0
set server_dir=%current_dir:\scripts=%
set root_dir=%server_dir:\SERVER=%

echo %server_dir%
cd %server_dir%

for /f %%i in (version.txt) do SET version=%%i

mkdir C:\Users\%username%\DUCKSPLOIT
Xcopy %root_dir%\SERVER C:\Users\%username%\DUCKSPLOIT /E /H /C /I /q

goto Register



:Register
cls
Title Register To Continue
echo.
echo  " _____             _              _       _ _   "
echo  "|  __ \           | |            | |     (_) |  "
echo  "| |  | |_   _  ___| | _____ _ __ | | ___  _| |_ "
echo  "| |  | | | | |/ __| |/ / __| '_ \| |/ _ \| | __|"
echo  "| |__| | |_| | (__|   <\__ \ |_) | | (_) | | |_ "
echo  "|_____/ \__,_|\___|_|\_\___/ .__/|_|\___/|_|\__|"
echo  "                           | |                  "
echo  "                           |_|                  "
echo.
echo ### You Must Create an account to continue ###
echo ### if you want to change these infos type register in ducksploit's terminal###
echo.
set /p user=Username:
if %user% == '' (echo [x] Bad Username&&goto Register) else (
(echo %user%)> C:\Users\%username%\DUCKSPLOIT\DATA\username.txt
goto password
)

:password
cls
echo.
echo  " _____             _              _       _ _   "
echo  "|  __ \           | |            | |     (_) |  "
echo  "| |  | |_   _  ___| | _____ _ __ | | ___  _| |_ "
echo  "| |  | | | | |/ __| |/ / __| '_ \| |/ _ \| | __|"
echo  "| |__| | |_| | (__|   <\__ \ |_) | | (_) | | |_ "
echo  "|_____/ \__,_|\___|_|\_\___/ .__/|_|\___/|_|\__|"
echo  "                           | |                  "
echo  "                           |_|                  "
echo.
echo Hello %user% ! Enter your new password..
echo.
echo.
set /p password=Password:
if %password% == '' (echo [x] Bad Password!&&goto password) else (
(echo %password%)> C:\Users\%username%\DUCKSPLOIT\DATA\password.txt
(time)> C:\Users\%username%\DUCKSPLOIT\DATA\time.txt

goto continue
)




:continue
echo.
set /p result="Create a menu shortcut? [y/n]"

if %result%==y (
echo.
echo [+] Installing Menu Shortcut...

cd "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\"
mkdir Ducksploit
cd %server_dir%
copy ducksploit.bat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "Ducksploit - Docs.cmd" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"
copy "DuckpvpTeam.bat" "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"

) else (echo [x] Cancelled)



echo.
set /p result2="Install Ducksploit v.%version% ...? [y/n]"

if %result2%==y (



echo.
echo [+] Installing Ducksploit v.%version% ...

@echo on
copy "%server_dir%\ducksploit.bat" "C:\Windows\System32"
copy "%server_dir%\sudoducksploit.bat" "C:\Windows\System32"
copy "%server_dir%\scripts\wget.exe" "C:\Windows\System32"
pause
echo [o] Ducksploit command version '%version%' configured!
@echo off



) else echo [x] Cancelled


set /p open="Would you open Ducksploit after installation? [y/n] "
if %open%==y (start cmd /C sudoducksploit&&exit)
echo [o] Ok!
pause

echo.
echo [o] Finished!
pause

color F