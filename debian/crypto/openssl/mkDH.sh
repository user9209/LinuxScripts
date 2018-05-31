size=$1
openssl dhparam -out dh$size.pem $size
