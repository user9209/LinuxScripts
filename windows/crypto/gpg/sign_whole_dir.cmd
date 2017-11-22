@echo off
rem mkdir toSign
cd toSign
for /r %%f in (*.*) do gpg --default-key FF321DFA1ECDC168D8D3E966AA8F3B3DD17DC3A5 --output %%f.sig --detach-sig %%f
cd ..
pause