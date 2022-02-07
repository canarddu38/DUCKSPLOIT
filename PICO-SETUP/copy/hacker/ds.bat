@echo off


cd C:\DuckSploit

color A
title Ducksploit - Hacker Version

:execute
echo.

echo "       dP                   dP                         dP          oo   dP   "
echo "       88                   88                         88               88   "
echo " .d888b88 dP    dP .d8888b. 88  .dP  .d8888b. 88d888b. 88 .d8888b. dP d8888P "
echo " 88'  `88 88    88 88'  `"" 88888"   Y8ooooo. 88'  `88 88 88'  `88 88   88   "
echo " 88.  .88 88.  .88 88.  ... 88  `8b.       88 88.  .88 88 88.  .88 88   88   "
echo " `88888P8 `88888P' `88888P' dP   `YP `88888P' 88Y888P' dP `88888P' dP   dP   "
echo "                                              88                             "
echo "                                              dP                             "


echo.


echo.
echo (DUCKSPLOIT)-[~%CD%]
set /p input=">>> "

title DUCKSPLOIT - %input%

for /f %%h in ("%input%") do SET command=%%h




findstr /m "2022;%command%;2022" C:\DuckSploit\cmdlist.txt >Nul
if %errorlevel%==0 (
goto find
)

if %errorlevel%==1 (
ECHO command not found try 'ds help' to get help.
)






:find
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a


IF (%command%) == (exit) ( 
color f
echo [x] Exited!
goto eof
)


IF (%command%) == (help) (type C:\DuckSploit\help.txt)

IF (%command%) == (version) echo DuckSploit version:&&type C:\DuckSploit\version.txt


IF (%command%) == (portscanner) (
python C:\DuckSploit\fast_port_scanner.py %NetworkIP% --ports 1-10000
)


IF (%command%) == (myinfo) (
(echo Username: %username%)
(echo IP: %NetworkIP%)
)


IF (%command%) == (chatconnect) (
echo chatconnect is bugged: then, we've disabled it
::if "%~2" == "" (echo Usage: ds chatconnect 'serverip') else (
::python C:\DuckSploit\chat\client.py %~2
)
)


IF (%command%) == (wait) (
echo [~] Awaiting connection...
python C:\DuckSploit\server.py %NetworkIP%
)


IF (%command%) == (credits) (
type C:\DuckSploit\credits.txt
)


IF (%command%) == (uninstall) (
call C:\DuckSploit\uninstall.Lnk
color A
goto eof
)



)

IF (%command%) == (update) ( 
del /q /s /f C:\DuckSploit\*.*
cd C:\temp
git clone https://github.com/canarddu38/DUCKSPLOIT.git ds
move C:\temp\ds C:\DuckSploit
echo updated!
)

pause
cls
goto execute