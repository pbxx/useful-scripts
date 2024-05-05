@echo off
REM Aodrable input routine for batch using VBScript to provide an input box
REM Stephen Knight, October 2009, http://www.dragon-it.co.uk/
REM Then later, used by Donavan Lewis and Jeff Scott in Node.js, March 2024
REM Modified by Donavan Lewis to accept arguments, and return only input

call :inputbox %2 %1
echo %Input%
exit /b

:InputBox
set input=
set heading=%~2
set message=%~1
echo wscript.echo inputbox(WScript.Arguments(0),WScript.Arguments(1)) >"%temp%\input.vbs"
for /f "tokens=* delims=" %%a in ('cscript //nologo "%temp%\input.vbs" "%message%" "%heading%"') do set input=%%a
exit /b