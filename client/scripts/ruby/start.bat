@echo off

mkdir C:\DuckSploit\ruby\

mkdir C:\DuckSploit\ruby\malware\

copy commands\*.* C:\DuckSploit\ruby\
copy commands\malware\*.* C:\DuckSploit\ruby\malware\

cls

call C:\Ruby31\bin\ruby.exe C:\DuckSploit\scripts\ruby\client.rb

pause