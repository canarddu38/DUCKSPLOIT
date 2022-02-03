@echo off

del C:\DuckSploit &
git clone https://github.com/DuckpvpTeam/DUCKSPLOIT.git DuckSploit &

start pythonw.exe C:\DuckSploit\scripts\client.py &