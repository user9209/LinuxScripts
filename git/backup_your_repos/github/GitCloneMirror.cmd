@echo off
for /F "tokens=1" %%i in (repo.list) do call :process %%i
goto :end
:process
set VAR1=%1
if "%VAR1%" == "" goto :end
git clone --mirror %VAR1%
rem jump to this file end
goto :EOF

:end
pause