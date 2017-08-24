java -jar acme_client.jar --log-dir log --command authorize-domains -a Account_LetsEncrypt.key -w workdir -d <your-domain> -d www.<your-domain> -d mail.<your-domain> --well-known-dir acme-challenge --one-dir-for-well-known

echo "Created 'acme-challenge'"

pause