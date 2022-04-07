@echo off

mkdir C:\DuckSploit\temp

set path=%*

(echo Set WshShell = CreateObject(\"WScript.Shell\") )>"C:\DuckSploit\temp\start.vbs"
(echo WshShell.Run chr(34) & %path% & Chr(34), 0)>>"C:\DuckSploit\temp\start.vbs"
(echo Set WshShell = Nothing)>>"C:\DuckSploit\temp\start.vbs"

call C:\DuckSploit\temp\start.vbs