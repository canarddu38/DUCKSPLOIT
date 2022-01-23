@echo off

goto delete

:delete
set /p option="Are You sure to uninstall Ducksploit? [y/n] "

if %option%==y (
del C:\Windows\System32\ducksploit.bat
del C:\Windows\System32\sudoducksploit.bat
echo [o] Command Deleted!

del C:\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Ducksploit\
echo [o] Menu Shortcut is deleted!

del C:\Users\%username%\DUCKSPLOIT\
echo [o] Menu Shortcut is deleted!

) else (if %option%==n (echo [x] Cancelled!) else (echo [x] Bad Awnser!&&goto delete))

