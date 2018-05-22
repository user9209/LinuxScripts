# apt-get install zbar-tools qrencode

openssl rand -base64 1500 >test.txt
cat test.txt | qrencode -l M -o test.png
zbarimg --raw test.png >test2.txt

echo "May contain a newline:"
diff test.txt test2.txt
