@echo off
for /D %%i in (*) do call :process %%i
goto :end
:process
set VAR1=%1
if "%VAR1%" == "" goto :end

cd %VAR1%
git remote update
cd ..

rem jump to this file end
goto :EOF

:end
pause