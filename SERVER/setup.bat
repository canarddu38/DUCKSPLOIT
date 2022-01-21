::move commands\*.* C:\Windows\System32
::copy commands\*.txt C:\Windows\System32
@echo off

cls

color C

for /f %%i in (version.txt) do SET version=%%i


set current_dir=%~dp0
::echo %current_dir%
cd %current_dir%

echo.
set /p result="Create a menu shortcut? [y/n]"

if %result%==y (goto menuinstall) else echo [x] Exit

set /p result2="Install Ducksploit V.%version% ...? [y/n]"


:cmdinstall
echo.
echo [+] Installing Ducksploit V.%version% ...

@echo on
copy ducksploit.bat C:\Windows\System32
@echo off

if exist C:\Users\%username%\DUCKSPLOIT (
copy commands\*.txt C:\Users\%username%\DUCKSPLOIT
) else (
mkdir C:\Users\%username%\DUCKSPLOIT
)

:menuinstall
echo.
echo [+] Installing Menu Shortcut...

if exist C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\DUCKSPLOIT (
@echo on
copy ducksploit.bat C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
@echo off
) else (
cd C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
mkdir DUCKSPLOIT
)