
#encrypt
echo>foo "content" && echo "asd" | gpg --cipher-algo aes256 --output - --passphrase-fd 0 --batch --yes --symmetric foo | base64 && rm foo

# decrypt
echo "jA0ECQMCXqcTgIN+jxJg0j0BlevHRFXUyOnWh9yO9YpueEUNNJO58kSl1LR5OEZ8f9u/QoD2ESM6vbSc1OKqFNx27EF/ZqzrXP1TTceH" | base64 -d>foo2 && echo "asd"  | gpg --cipher-algo aes256 --decrypt --output - --passphrase-fd 0 --batch --yes foo2 2>/dev/null && rm foo2