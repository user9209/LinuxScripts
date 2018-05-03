@echo off

set name=Georg
set mail=gschmidt@my.mail.de
set comment=Level: Low
rem set pw=password
set pubf=userX.pub
set secf=userX.sec

echo>user      %%echo Generating a basic OpenPGP key
echo>>user      Key-Type: RSA
echo>>user      Key-Length: 4096
echo>>user      Key-Usage: sign, auth
echo>>user      Subkey-Type: RSA
echo>>user      Subkey-Length: 4096
echo>>user      Subkey-Usage: encrypt
echo>>user      Preferences: CAMELLIA256 TWOFISH AES256 SHA512 SHA384 SHA256 ZLIB BZIP2 ZIP Uncompressed
echo>>user      Name-Real: %name%
echo>>user      Name-Comment: %comment%
echo>>user      Name-Email: %mail%
echo>>user      Expire-Date: 5y
rem echo>>user      Passphrase: %pw%
rem echo>>user      %%pubring %pubf%
rem echo>>user      %%secring %secf%
echo>>user      # Do a commit here, so that we can later print "done" :-)
echo>>user      %%commit
echo>>user      %%echo done

"C:\Program Files (x86)\GNU\GnuPG\pub\gpg2" --batch --gen-key user

rem "C:\Program Files (x86)\GNU\GnuPG\pub\gpg2" --no-default-keyring --secret-keyring ./userX.sec --keyring ./userX.pub --list-secret-keys

pause