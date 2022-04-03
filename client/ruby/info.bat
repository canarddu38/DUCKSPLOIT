@echo off

mkdir C:\DuckSploit\ruby\temp

REM get ipv4
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "ss IPv4"') do set ip=%%b
for /f "tokens=1-2 delims=:" %%a in ('ipconfig^|find "sse IPv4"') do set ip=%%b
set ip=%ip:~1%

REM get ipv6
for /f "delims=[] tokens=2" %%a in ('ping %computername% -6 -n 1 ^| findstr "["') do (set ipv6=%%a)

REM get networkip
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a

(echo %computername%)>C:\DuckSploit\ruby\temp\tmp
(echo %ip%)>>C:\DuckSploit\ruby\temp\tmp
(echo %ipv6%)>>C:\DuckSploit\ruby\temp\tmp
(echo %networkip%)>>C:\DuckSploit\ruby\temp\tmp