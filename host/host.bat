@echo off

set path=C:\$DuckSploitw\pannel

set port=8013


cd C:\Ruby31\bin


start ruby.exe -run -e httpd %path% -p %port%

REM call %0