::move commands\*.* C:\Windows\System32
::copy commands\*.txt C:\Windows\System32
@echo off

cls

color C

set current_dir=%~dp0
set server_dir=%current_dir:\scripts=%

set root_dir=%current_dir:\SERVER=%

echo %server_dir%

cd %server_dir%

for /f %%i in (version.txt) do SET version=%%i

echo.
set /p result="Create a menu shortcut? [y/n]"

if %result%==y (
echo.
echo [+] Installing Menu Shortcut...

if exist C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit (
copy %server_dir%\ducksploit.bat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksloit"
) else (
cd C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs
mkdir Ducksploit
copy %server_dir%\ducksploit.bat "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\
)

) else (echo [x] Cancelled)

echo.
set /p result2="Install Ducksploit V.%version% ...? [y/n]"

if %result2%==y (
echo.
echo [+] Installing Ducksploit V.%version% ...

xcopy %server_dir%\ducksploit.bat C:\Windows\System32 /s /e /h

if exist C:\Users\%username%\DUCKSPLOIT (
xcopy %root_dir%\SERVER\ C:\Users\%username%\DUCKSPLOIT /s /e /h
) else (
mkdir C:\Users\%username%\DUCKSPLOIT
xcopy %server_dir% C:\Users\%username%\DUCKSPLOIT /s /e /h
)

) else echo [x] Cancelled

echo.
echo [o] Finished!
pause

color F