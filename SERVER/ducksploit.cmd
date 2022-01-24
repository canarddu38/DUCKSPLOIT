@echo off
cls

color 6

SET path=C:\Users\%username%\DUCKSPLOIT
set server_dir=%path%


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
goto Login


for /f %%i in (%path%\DATA\username.txt) do set USERNAME2=%%i
for /f %%i in (%path%\DATA\password.txt) do set PASSWORD2=%%i


:Login
cls
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
for /f %%i in (%path%\DATA\username.txt) do set USERNAME2=%%i
for /f %%i in (%path%\DATA\password.txt) do set PASSWORD2=%%i
set /p user=Username:
if %user% == '' echo [x] Bad Username
if %user% == %USERNAME2% goto password
goto Login

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
echo Hello %user% ! Enter your password..
echo.
echo.
for /f %%i in (%path%\DATA\username.txt) do set USERNAME2=%%i
for /f %%i in (%path%\DATA\password.txt) do set PASSWORD2=%%i
set /p password=Password:
if %password% == '' echo [x] Bad Username
if %password% == %PASSWORD2% sudoducksploit
goto password