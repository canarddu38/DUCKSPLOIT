@echo off
setlocal enableextensions disabledelayedexpansion

mkdir C:\DuckSploit\temp

REM set path=%*
set path=C:\DuckSploit\startclient.bat


copy C:\DuckSploit\scripts\root\start.vbs C:\DuckSploit\temp\


    

@echo off 
    setlocal enableextensions disabledelayedexpansion

    set "search=%1"
    set "replace=%2"

    set "textFile=Input.txt"

    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%textFile%" echo(!line:%search%=%replace%!
        endlocal
    )

start C:\DuckSploit\temp\start.vbs