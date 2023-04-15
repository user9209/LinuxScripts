# Password Recovery via utilman.exe

## Extra for new windows systems

### Disable Windows Defender

"Schutz des Antischadsoftware-Frühstarts deaktivieren"


Use osk.exe (Bildschirmtastatur)

````
rename osk.exe osk.bak 
copy cmd.exe osk.exe
````

See: https://www.deskmodder.de/wiki/index.php?title=Passwort_zur%C3%BCcksetzen_utilman.exe_weiterhin_nutzen_Windows_10_1809_und_h%C3%B6her


## boot linux or win

### linux
````
mv ./Windows/System32/Utilman.exe ./Windows/System32/Utilman.exe.org
cp ./Windows/System32/cmd.exe ./Windows/System32/Utilman.exe
````

### windows
````
move C:\Windows\System32\Utilman.exe C:\Windows\System32\Utilman.exe.org
copy C:\Windows\System32\cmd.exe C:\Windows\System32\Utilman.exe
````

## reboot device into windows

## Show users
````
net user
````

## add new user
````
net user recuser rec /add
````

## make demo to admin

### German
````
net localgroup Administratoren recuser /add
````

### English
````
net localgroup administrators recuser /add
````

### Get list
````
net localgroup
````


## login as "recuser" with pw "rec"

login as admin user


## All in One
````
net user
net user <username> <password> /add
net localgroup administrators <username> /add
````
