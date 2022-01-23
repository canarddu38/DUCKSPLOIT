@echo off
:help
echo.
echo Help - DUCKSPLOIT
echo    [0] Account
echo    [1] Config
echo    [2] Exploits
echo    [3] Mouse Control
echo    [4] Spy
echo    [5] Troll
echo    [6] Mysc
echo.

set /p input="Choose option: [int] "
if %input%==0 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\account.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==1 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\config.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==2 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\exploits.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==3 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\mouse.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==4 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\spy.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==5 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\troll.txt) do echo %%i&&pause&&sudoducksploit) else (
if %input%==6 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\mysc.txt) do echo %%i&&pause&&sudoducksploit) else (
echo [x] Invalid Arg
goto help
)
)
)
)
)
)
)