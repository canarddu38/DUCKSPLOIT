@echo off

set lasttpath=%cd%
:help
echo.
echo Help - DUCKSPLOIT
echo    [0] Launch
echo    [1] Account
echo    [2] Config
echo    [3] Exploits
echo    [4] Mouse Control
echo    [5] Alert Window
echo    [6] Troll
echo    [7] Mysc
echo.


set /p input="Choose option: [int] "
if %input%==0 (type C:\Users\%username%\DUCKSPLOIT\help\launch.txt&&pause&&sudoducksploit) else (
if %input%==1 (type C:\Users\%username%\DUCKSPLOIT\help\account.txt&&pause&&sudoducksploit) else (
if %input%==2 (type C:\Users\%username%\DUCKSPLOIT\help\config.txt&&pause&&sudoducksploit) else (
if %input%==3 (type C:\Users\%username%\DUCKSPLOIT\help\exploits.txt&&pause&&sudoducksploit) else (
if %input%==4 (type C:\Users\%username%\DUCKSPLOIT\help\mouse.txt&&pause&&sudoducksploit) else (
if %input%==5 (type C:\Users\%username%\DUCKSPLOIT\help\alertwindow.txt&&pause&&sudoducksploit) else (
if %input%==6 (type C:\Users\%username%\DUCKSPLOIT\help\troll.txt&&pause&&sudoducksploit) else (
if %input%==7 (type C:\Users\%username%\DUCKSPLOIT\help\mysc.txt&&pause&&sudoducksploit) else (
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