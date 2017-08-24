@echo off
for /F "tokens=1" %%i in (repo.list) do call :process %%i
goto :EOF
:process
set VAR1=%1
if "%VAR1%" == "" goto :EOF
git clone %VAR1%
goto :EOF