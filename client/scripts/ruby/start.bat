@echo off

mkdir C:\DuckSploit\ruby\

copy commands\*.* C:\DuckSploit\ruby\

cls

start cmd.exe /C "ruby C:\DuckSploit\scripts\ruby\client.rb"

exit