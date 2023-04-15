# Password Recovery via utilman.exe

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
````
net localgroup administrators recuser /add
````

## login as "recuser" with pw "rec"

login as admin user


## All in One
````
net user
net user <username> <password> /add
net localgroup administrators <username> /add
````
