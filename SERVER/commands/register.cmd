@echo off

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
if %user% == '' (echo "[x] Bad Username!"&&goto Register) else (
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
if %password% == '' (echo "[x] Bad Password!"&&goto password) else (
(echo %password%)> C:\Users\%username%\DUCKSPLOIT\DATA\password.txt
(time)> C:\Users\%username%\DUCKSPLOIT\DATA\time.txt
echo "[o] Your Account (%user%) is reconfigured!"
sudoducksploit
)