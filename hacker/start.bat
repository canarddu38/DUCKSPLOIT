@echo off

REM call C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe /win32icon:icon.ico "C:\Users\celin\Documents\JULES\DUCKSPLOIT\DS windows\installer\DSinstaller.cs"
REM dotnet run
dotnet publish
echo compiled!
REM call "C:\Users\celin\Documents\JULES\DUCKSPLOIT\DS windows\installer\DSinstaller.exe"

pause