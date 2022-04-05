@echo off
echo disable signature ps1
powershell -noprofile -executionpolicy bypass -command "&{start-process powershell -argumentlist 'set-executionpolicy remotesigned' -verb runas}"
pause