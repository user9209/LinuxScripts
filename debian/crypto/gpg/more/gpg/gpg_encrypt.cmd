gpg --encrypt -a --recipient <Name oder Key_Id> test.txt 
gpg --encrypt -a --recipient <Name oder Key_Id> -o test.txt 


gpg --decrypt --output entschluesselt.txt test.txt.asc 

# get test.txt.asc
gpg --detach-sign -a test.txt


gpg --clearsign -a test.txt

gpg --verify test.txt.asc
gpg --verify signaturdatei.asc test.txt 