@echo off

cd C:\Users\celin\Documents\JULES\DUCKSPLOIT\DS windows\server

call C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe /win32icon:icon.ico /r:Mono.Nat.dll *.cs dscrypter\dscrypter.cs
echo compiled!
call ds.exe

pause