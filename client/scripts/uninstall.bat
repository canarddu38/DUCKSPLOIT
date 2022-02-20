taskkill /IM pythonw.exe /f


del /f /s /q C:\DuckSploit
del /f /s /q C:\$DuckSploitw

del /f /q "C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\launch.bat"

rmdir /s /q C:\DuckSploit
rmdir /s /q C:\$DuckSploitw

del C:\Windows\System32\ds.bat

rmdir /s /q C:\DuckSploit
rmdir /s /q C:\$DuckSploitw
echo [x] Uninstalled!
pause
exit