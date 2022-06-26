@echo off

set path=C:\DuckSploit\GUI

if exist (%path%\temp) (rmdir temp) 

mkdir temp

copy %path%\*.* %path%\temp

ren %path%\temp\main.ps main.ps1
ren %path%\temp\edit.ps edit.ps1
ren %path%\temp\view.ps view.ps1
ren %path%\temp\add_victim.ps add_victim.ps1

cd %path%\temp

call start.bat


