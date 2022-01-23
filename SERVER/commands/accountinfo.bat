@echo off

for /f %%i in (%path%\DATA\username.txt) do set USERNAME2=%%i
for /f %%i in (%path%\DATA\password.txt) do set PASSWORD2=%%i
for /f %%i in (%path%\DATA\time.txt) do set TIME2=%%i


echo Username: %USERNAME2%
echo Password: %PASSWORD2%
echo Created: %TIME2%