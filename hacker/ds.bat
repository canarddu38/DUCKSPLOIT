@echo off
set version=V1.0.8

mkdir %temp%\DuckSploit
cls
powershell "(New-Object System.Net.WebClient).DownloadFile("https://raw.githubusercontent.com/canarddu38/DUCKSPLOIT/root/hacker/anim.ps1", "%temp%/DuckSploit/anim.ps1")"
cls
powershell %temp%\DuckSploit\anim.ps1
cls

powershell %temp%\DuckSploit\ducksploit.ps1
