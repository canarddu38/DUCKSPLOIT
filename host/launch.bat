@echo off


if "%1"=="" (echo [x] Error&&goto exit) else (
echo %1
set root_dir=%1

mkdir C:\$DuckSploitw\

Xcopy %root_dir%\host\*.* C:\$DuckSploitw /E /H /C /I /Y

start pythonw.exe C:\$DuckSploitw\host.py
echo [o] Started server!
)
