@echo off

echo %1
set root_dir=%1
pause

mkdir C:\$DuckSploitw\

Xcopy %root_dir%\host\*.* C:\$DuckSploitw /E /H /C /I

start python.exe C:\$DuckSploitw\host.py
echo [o] Started server!
pause