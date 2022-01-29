:: Makes new empty files
@ECHO OFF
IF (%1) == () ECHO Unknown command, type 'ds help' to get help.
:TOP
::no command
IF (%1) == () GOTO END

::help
IF (%1) == (help) type C:\Users\%username%\DUCKSPLOIT\help\help.txt

::register
IF (%1) == (register) (
if (%2)==() (echo [x] Username cant be empty!) else (if (%3)==() (echo [x] Password cant be empty!) else (
(echo %2)> C:\Users\%username%\DUCKSPLOIT\DATA\username.txt
(echo %3)> C:\Users\%username%\DUCKSPLOIT\DATA\passowrd.txt
(echo %time%)> C:\Users\%username%\DUCKSPLOIT\DATA\time.txt
)
)
) 

::version
IF (%1) == (version) type C:\Users\%username%\DUCKSPLOIT

SHIFT
GOTO TOP
:END