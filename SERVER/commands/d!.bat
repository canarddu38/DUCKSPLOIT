@echo off

SET command=%1
SET path=C:\Users\%username%\DUCKSPLOIT

for /f %%i in (%path%\DATA\username.txt) do set USERNAME2=%%i
for /f %%i in (%path%\DATA\password.txt) do set PASSWORD2=%%i
for /f %%i in (%path%\DATA\time.txt) do set TIME2=%%i
for /f %%i in (%path%\DATA\myip.txt) do set IP2=%%i

cls

::help
if %command%==help (
echo help

)
::update
if %command%==update (
git clone https://github.com/canarddu38/DUCKSPLOIT.git C:\Users\%username%\DUCKSPLOIT
echo [+] Updated!
)

::accountinfo
if %command%==accountinfo (
echo Username: %USERNAME2%
echo Password: %PASSWORD2%
echo IP: %IP2%
echo Created: %TIME2%
)

::register
if %command%==register (
goto Register
:Register
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
if %user% == '' (echo "[x] Bad Password!"&&goto Register)

echo Hello %user% ! Enter your new password..
echo.
echo.
set /p password=Password:
if %password% == '' (echo "[x] Bad Password!"&&goto password) else (
(echo %password%)> C:\Users\%username%\DUCKSPLOIT\DATA\password.txt
(echo %user%)> C:\Users\%username%\DUCKSPLOIT\DATA\username.txt
(time)> C:\Users\%username%\DUCKSPLOIT\DATA\time.txt
echo "[o] Your Account (%user%) is reconfigured!"
)
)

)

::setip
if %command%==setip (
set arg2=%2
echo %arg2%
(echo %arg2%)>C:\Users\%username%\DUCKSPLOIT\myip.txt
echo [+] Your IP sets to %arg2%
)

::wait
if %command%==wait (
cd C:\Users\%username%\DUCKSPLOIT
call server.py
)

::test
if %command%==test (
set /p 1=5
)



