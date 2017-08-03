@echo off


rem https://megatools.megous.com/man/megaput.html
if exist "%2" goto ok1

echo "mega_put.cmd <file-local>"
exit


:ok1
megaput --disable-previews %1
exit