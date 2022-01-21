:help
echo.
echo Help - DUCKSPLOIT
echo    [0] Config
echo    [1] Exploits
echo    [2] Mouse Control
echo    [3] Spy
echo    [4] Mysc
echo.

set /p input="Choose option: [int] "

if %input%==0 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\config.txt) do echo %%i&&sleep 3&&ducksploit) else (
if %input%==1 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\exploits.txt) do echo %%i&&sleep 3&&ducksploit) else (
if %input%==2 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\mouse.txt) do echo %%i&&sleep 3&&ducksploit) else (
if %input%==3 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\spy.txt) do echo %%i&&sleep 3&&ducksploit) else (
if %input%==4 (for /f %%i in (C:\Users\%username%\DUCKSPLOIT\help\mysc.txt) do echo %%i&&sleep 3&&ducksploit) else (
echo [x] Invalid Arg
goto help
)
)
)
)
)

ducksploit