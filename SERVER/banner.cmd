@echo off

cls

color 6 

echo  " _____             _              _       _ _   "   
echo  "|  __ \           | |            | |     (_) |  "  
echo  "| |  | |_   _  ___| | _____ _ __ | | ___  _| |_ " 
echo  "| |  | | | | |/ __| |/ / __| '_ \| |/ _ \| | __|"
echo  "| |__| | |_| | (__|   <\__ \ |_) | | (_) | | |_ "
echo  "|_____/ \__,_|\___|_|\_\___/ .__/|_|\___/|_|\__|"
echo  "                           | |                  "
echo  "                           |_|                  "

echo.

echo @DuckpvpTeam - all right reserved

setlocal EnableDelayedExpansion
for /f %%a in ('copy /Z "%~dpf0" nul') do set "CR=%%a"

FOR /L %%n in (1,1,10) DO (
    call :spinner
    ping localhost -n 2 > nul
)
cls
color A
echo loaded!

:spinner
set /a "spinner=(spinner + 1) %% 4"
set "spinChars=\|/-"
<nul set /p ".=Waiting !spinChars:~%spinner%,1!!CR!"
exit /b