@echo off

cd C:\Users\celin\Documents\JULES\DUCKSPLOIT\DS windows\server

call C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe /win32icon:icon.ico "C:\Users\celin\Documents\JULES\DUCKSPLOIT\DS windows\server\*.cs" dscrypter\dscrypter.cs
echo compiled!
call "C:\Users\celin\Documents\JULES\DUCKSPLOIT\DS windows\server\ds.exe"

pause