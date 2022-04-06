@echo off

mkdir C:\DuckSploit\ruby\

copy commands\*.* C:\DuckSploit\ruby\

cls

call C:\Ruby31\bin\ruby.exe C:\DuckSploit\scripts\ruby\client.rb

pause