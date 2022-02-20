@echo off
set linescount=0
set totallinescount=0

del test.csv

REM head of the table
set "basestr=Question Response"
set basestrvirg=%basestr: =;%
echo %basestrvirg%>>test.csv

title Greta - QUESTIONNAIRE

:menu
cls
echo "  ______                                   __      __                                          __                     "
echo " /      \                                 /  |    /  |                                        /  |                    "
echo "/$$$$$$  | __    __   ______    _______  _$$ |_   $$/   ______   _______   _______    ______  $$/   ______    ______  "
echo "$$ |  $$ |/  |  /  | /      \  /       |/ $$   |  /  | /      \ /       \ /       \  /      \ /  | /      \  /      \ "
echo "$$ |  $$ |$$ |  $$ |/$$$$$$  |/$$$$$$$/ $$$$$$/   $$ |/$$$$$$  |$$$$$$$  |$$$$$$$  | $$$$$$  |$$ |/$$$$$$  |/$$$$$$  |"
echo "$$ |_ $$ |$$ |  $$ |$$    $$ |$$      \   $$ | __ $$ |$$ |  $$ |$$ |  $$ |$$ |  $$ | /    $$ |$$ |$$ |  $$/ $$    $$ |"
echo "$$ / \$$ |$$ \__$$ |$$$$$$$$/  $$$$$$  |  $$ |/  |$$ |$$ \__$$ |$$ |  $$ |$$ |  $$ |/$$$$$$$ |$$ |$$ |      $$$$$$$$/ "
echo "$$ $$ $$< $$    $$/ $$       |/     $$/   $$  $$/ $$ |$$    $$/ $$ |  $$ |$$ |  $$ |$$    $$ |$$ |$$ |      $$       |"
echo " $$$$$$  | $$$$$$/   $$$$$$$/ $$$$$$$/     $$$$/  $$/  $$$$$$/  $$/   $$/ $$/   $$/  $$$$$$$/ $$/ $$/        $$$$$$$/ "
echo "     $$$/                                                                                                             
echo.                                                                                                                                                                                                                                     
echo "  ______                         __                        "
echo " /      \                       /  |                       "                                                           
echo "/$$$$$$  |  ______    ______   _$$ |_     ______           "                                                         
echo "$$ | _$$/  /      \  /      \ / $$   |   /      \          "                                                           
echo "$$ |/    |/$$$$$$  |/$$$$$$  |$$$$$$/    $$$$$$  |         "                                                           
echo "$$ |$$$$ |$$ |  $$/ $$    $$ |  $$ | __  /    $$ |         "                                                           
echo "$$ \__$$ |$$ |      $$$$$$$$/   $$ |/  |/$$$$$$$ |         "                                                           
echo "$$    $$/ $$ |      $$       |  $$  $$/ $$    $$ |         "                                                           
echo " $$$$$$/  $$/        $$$$$$$/    $$$$/   $$$$$$$/          " 
echo.
echo Greta - Simple Questionnaire
echo.
echo   1)commencer
echo   2)aide
echo   3)quitter
echo.
set /p menu="Choisissez une option [1, 2, 3]: " 
if "%menu%"=="1" (goto start) else (
if "%menu%"=="2" (goto help) else (
if "%menu%"=="3" (goto exit) else (

echo [x] Mauvaise reponse!
pause
goto menu
)
)
)
:help
cls
type files\help.txt
echo.
pause
goto menu

:exit
cls
exit



:start
for /f "tokens=*" %%a in (files\questions.txt) do set /A totallinescount=totallinescount+1
for /f "tokens=*" %%a in (files\questions.txt) do set /A linescount=linescount+1&&call :processline %%a
echo finished
cls






echo [o] le questionnaire est maintenant complete
echo merci d'avoir participe!
pause
goto eof 

:processline

cls
echo %* ?
set questionname%linescount%=%*
set /p input="Votre reponse [y/n]: "

if "%input%"=="Y" (set input2="Oui") else (
if "%input%"=="N" (set input2="Non") else (
if "%input%"=="y" (set input2="Oui") else (
if "%input%"=="n" (set input2="Non") else (
set input2="Sans avis"
)
)
)
)


REM new table line
set "newline=%*;%input2%"

echo %newline%>>test.csv

set question%linescount%=%input2%
echo QUESTION:[%linescount%/%totallinescount%]



