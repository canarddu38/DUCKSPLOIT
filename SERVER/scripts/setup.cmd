::move commands\*.* C:\Windows\System32
::copy commands\*.txt C:\Windows\System32
@echo off

cls

color C

set current_dir=%~dp0
set server_dir=%current_dir:\scripts=%
set root_dir=%server_dir:\SERVER=%

echo %server_dir%
cd %server_dir%

for /f %%i in (version.txt) do SET version=%%i

echo.
set /p result="Create a menu shortcut? [y/n]"

if %result%==y (
echo.
echo [+] Installing Menu Shortcut...

cd C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\
mkdir Ducksploit
cd %server_dir%
copy ducksploit.bat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\"


) else (echo [x] Cancelled)





echo.
set /p result2="Install Ducksploit v.%version% ...? [y/n]"

if %result2%==y (



echo.
echo [+] Installing Ducksploit v.%version% ...

echo on
copy %server_dir%\ducksploit.bat "C:\Windows\System32"
pause
echo [o] Ducksploit command version '%version%' configured!
echo off


if exist C:\Users\%username%\DUCKSPLOIT (
copy /e /i %server_dir% "C:\Users\%username%\DUCKSPLOIT"
) else (
mkdir C:\Users\%username%\DUCKSPLOIT
copy /e /i %server_dir% "C:\Users\%username%\DUCKSPLOIT"
)

echo [o] Commands are now ready to use!

) else echo [x] Cancelled

echo.
echo [o] Finished!
pause

color F