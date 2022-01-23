@echo off
cls


color 6



SET path=C:\Users\%username%\DUCKSPLOIT
set server_dir=%path%


for /f %%i in (%path%\username.txt) do set USERNAME2=%%i
for /f %%i in (%path%\password.txt) do set PASSWORD=%%i


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
echo   [0] Login
echo   [1] Register
SET /p loginorregister="Choose Option [int]: "
if %loginorregister% == 0 goto Login
if %loginorregister% == 1  goto Register



:Login
Title Login To Continue
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
set /p user=Username:
if %user% == '' echo [x] Bad Username
if %user% == %USERNAME2% goto password1
goto Login

:password1
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
echo Hello %user% ! Enter your password..
echo.
echo.
set /p password=Password:
if %password% == '' echo [x] Bad Username
if %password% == %PASSWORD% sudoducksploit
goto password1

:Gui
cls
Title [ CZ75 SP ] Simple Login - https://github.com/hashxxx
color 6
echo You are connected !
pause




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
set /p user=Username:
if %user% == '' (echo [x] Bad Username) else (
(echo %user%)> C:\Users\%username2%\DUCKSPLOIT\DATA\username.txt
goto password2
)
goto Register

:password2
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
if %password% == '' (echo [x] Bad Password!) else (
(echo %password%)> C:\Users\%username%\DUCKSPLOIT\DATA\password.txt

ducksploit
)
goto password2
)