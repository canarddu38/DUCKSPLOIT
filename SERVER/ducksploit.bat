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

if exist %path%\commands\%start%.bat (

call %path%\commands\%start%.bat %1 %2 %3 %4

) else (
echo [x] Unknown command type help to get command list
)

)
goto execute