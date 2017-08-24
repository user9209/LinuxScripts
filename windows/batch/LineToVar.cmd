@echo off
for /F "tokens=1,2,3" %%i in (LineToVar.txt) do call :process %%i %%j %%k
goto :EOF
:process
set VAR1=%1
set VAR2=%2
set VAR3=%3
echo %VAR1% %VAR2% %VAR3%
goto :EOF