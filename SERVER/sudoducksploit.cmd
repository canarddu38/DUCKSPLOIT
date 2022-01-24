@echo off

cd \
cd Users\%username%\DUCKSPLOIT

SET path=C:\Users\%username%\DUCKSPLOIT
cls
color A

:execute
echo.
echo (DUCKSPLOIT)-[~%CD%]
set /p input=">>> "

title DUCKSPLOIT - %input%

for /f %%h in ("%input%") do SET start=%%h


if %start%==exit (
cls
color f
echo [-] Exit
goto:eof
) else (


set arg1=%1
set arg2=%2
set arg3=%3
set arg4=%4
set arg5=%5
set arg6=%6
set arg7=%7


if exist %path%\commands\%start%.cmd (

call commands\%start%.cmd %arg1% %arg2% %arg3% %arg4% %arg5% %arg6% %arg7%

) else (
echo [x] Unknown command type help to get command list
)

)
goto execute