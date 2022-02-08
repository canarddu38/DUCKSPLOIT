@echo off

echo %cd%
pause
pause

mkdir C:\$DuckSploitw\

Xcopy *.* C:\$DuckSploitw /E /H /C /I

start python.exe C:\$DuckSploitw\host.py
echo [o] Started server!
pause