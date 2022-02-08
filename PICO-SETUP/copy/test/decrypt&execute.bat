@echo off
SETLOCAL EnableDelayedExpansion

for /f "Tokens=* Delims=" %%x in (code.txt) do set code=!code!%%x

echo %code%

::sets code to lowercase

SET code2=%code%

set code2=%code2:/1/=a% 
set code2=%code2:/2/=b% 
set code2=%code2:/3/=c% 
set code2=%code2:/4/=d% 
set code2=%code2:/5/=e% 
set code2=%code2:/6/=f% 
set code2=%code2:/7/=g% 
set code2=%code2:/8/=h% 
set code2=%code2:/9/=i% 
set code2=%code2:/10/=j% 
set code2=%code2:/11/=k% 
set code2=%code2:/12/=l% 
set code2=%code2:/13/=m% 
set code2=%code2:/14/=n% 
set code2=%code2:/15/=o% 
set code2=%code2:/16/=p% 
set code2=%code2:/17/=q% 
set code2=%code2:/18/=r% 
set code2=%code2:/19/=s% 
set code2=%code2:/20/=t% 
set code2=%code2:/21/=u% 
set code2=%code2:/22/=v% 
set code2=%code2:/23/=w% 
set code2=%code2:/24/=x% 
set code2=%code2:/25/=y% 
set code2=%code2:/26/=z%

echo Finished!

del /q decrypted.txt

echo %code2%>> decrypted.txt

endlocal
pause