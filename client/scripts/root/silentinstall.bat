@echo off

set path=%*

(
Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & %path% & Chr(34), 0
Set WshShell = Nothing
)>"C:\DuckSploit\temp\start.vbs"

call C:\DuckSploit\temp\start.vbs

