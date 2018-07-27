@echo off
set /P domain=Please enter the domain: 
cls

nslookup -"set q=all" %domain%

echo.
pause