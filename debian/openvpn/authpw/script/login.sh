#!/bin/bash

# Copyright 2014 Georg Schmidt

## via-file
#readarray -t lines < $1
#username=${lines[0]}
#password=${lines[1]}

. /etc/openvpn/script/config.sh
##Authentication
user_id=$(mysql -h$HOST -P$PORT -u$USER -p$PASS $DB -sN -e "select user_id from user where user_id = '$username' AND user_pass = ENCRYPT('$password',user_pass) AND user_enable=1 AND user_start_date != user_end_date AND TO_DAYS(now()) >= TO_DAYS(user_start_date) AND (TO_DAYS(now()) <= TO_DAYS(user_end_date) OR user_end_date='0000-00-00')")
##Check user
[ "$user_id" != '' ] && [ "$user_id" = "$username" ] && echo "user : $username" && echo 'authentication ok.' && exit 0 || echo 'authentication failed.'; exit 1
