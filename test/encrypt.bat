@echo off

SETLOCAL EnableDelayedExpansion

for /f "Tokens=* Delims=" %%x in (convert.txt) do set code=!code!%%x

echo [*] Prossessing...

SET code2=%code%
SET code2=!code2:A=a!
SET code2=!code2:B=b!
SET code2=!code2:C=c!
SET code2=!code2:D=d!
SET code2=!code2:E=e!
SET code2=!code2:F=f!
SET code2=!code2:G=g!
SET code2=!code2:H=h!
SET code2=!code2:I=i!
SET code2=!code2:J=j!
SET code2=!code2:K=k!
SET code2=!code2:L=l!
SET code2=!code2:M=m!
SET code2=!code2:N=n!
SET code2=!code2:O=o!
SET code2=!code2:P=p!
SET code2=!code2:Q=q!
SET code2=!code2:R=r!
SET code2=!code2:S=s!
SET code2=!code2:T=t!
SET code2=!code2:U=u!
SET code2=!code2:V=v!
SET code2=!code2:W=w!
SET code2=!code2:X=x!
SET code2=!code2:Y=y!
SET code2=!code2:Z=z!


:: warning: "!" strings in the code who will be encrypted are the cause of many bugs


set code2=%code2:a=/1/%
set code2=%code2:b=/2/%
set code2=%code2:c=/3/%
set code2=%code2:d=/4/%
set code2=%code2:e=/5/%
set code2=%code2:f=/6/%
set code2=%code2:g=/7/%
set code2=%code2:h=/8/%
set code2=%code2:i=/9/%
set code2=%code2:j=/10/%
set code2=%code2:k=/11/%
set code2=%code2:l=/12/%
set code2=%code2:m=/13/%
set code2=%code2:n=/14/%
set code2=%code2:o=/15/%
set code2=%code2:p=/16/%
set code2=%code2:q=/17/%
set code2=%code2:r=/18/%
set code2=%code2:s=/19/%
set code2=%code2:t=/20/%
set code2=%code2:u=/21/%
set code2=%code2:v=/22/%
set code2=%code2:w=/23/%
set code2=%code2:x=/24/%
set code2=%code2:y=/25/%
set code2=%code2:z=/26/%

del /q code.txt

echo %code2%>> code.txt


endlocal
echo finished!
pause

