SET title=%2
SET line1=%3
SET line2=%4


if %1==-file (FOR /F "tokens=*" %%f IN (text.txt) DO SET file=%%f &&(echo MsgBox "%file%" ^& vbCrLf ^& "%line2%" ,16, "%title%")> File.vbs && start File.vbs) else (echo MsgBox "%line1%" ^& vbCrLf ^& "%line2%" ,16, "%title%")> File.vbs && start File.vbs