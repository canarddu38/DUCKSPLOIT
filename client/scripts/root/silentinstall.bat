@echo off

mkdir C:\DuckSploit\temp

set path=%*

set par=)

set line1=Set WshShell = CreateObject("WScript.Shell")
set line2=WshShell.Run chr(34) & %path% & Chr(34), 0
set line3=Set WshShell = Nothing

(echo %line1%)>"C:\DuckSploit\temp\start.vbs"
(echo %line2%)>>"C:\DuckSploit\temp\start.vbs"
(echo %line3%)>>"C:\DuckSploit\temp\start.vbs"

start C:\DuckSploit\temp\start.vbs