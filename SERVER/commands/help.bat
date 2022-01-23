@echo off
:help
echo.
echo Help - DUCKSPLOIT
echo    [0] Launch
echo    [1] Account
echo    [2] Config
echo    [3] Exploits
echo    [4] Mouse Control
echo    [5] Spy
echo    [6] Troll
echo    [7] Mysc
echo.

set /p input="Choose option: [int] "
if %input%==0 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\launch.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==1 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\account.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==2 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\config.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==3 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\exploits.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==4 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\mouse.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==5 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\spy.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==6 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\troll.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==7 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\mysc.txt) do echo %%i&&pause&&sudoducksploit) else (
echo [x] Invalid Arg
goto help
)
)
)
)
)
)
)
)