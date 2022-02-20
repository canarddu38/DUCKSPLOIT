@echo off

setlocal
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "6.3" setx winver "Windows 8.1"
if "%version%" == "6.2" setx winver "Windows 8"
if "%version%" == "6.1" setx winver "Windows 7"
if "%version%" == "6.0" setx winver "Windows Vista"
if "%version%" == "10.0" setx winver "Windows 10"
echo %version%
echo.
echo %winver%
endlocal