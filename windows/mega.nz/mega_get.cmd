@echo off

rem https://megatools.megous.com/man/megaget.html

if "%1" == "" goto end1
if exist "%2" goto ok1
goto end1

:ok1
megaget --path "%2" "/Root/%1"

exit

:end1
echo "mega_get.cmd <file-remote> [<dir-local>]"
exit