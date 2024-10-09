# Debian 12 with Java 21

09.10.2024

## Using Amazon Corretto 21

````
wget -O - https://apt.corretto.aws/corretto.key | gpg --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && \
echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | tee /etc/apt/sources.list.d/corretto.list
````

install

````
apt update; apt install -y java-21-amazon-corretto-jdk
````


See [AWS](https://docs.aws.amazon.com/corretto/latest/corretto-21-ug/generic-linux-install.html)
