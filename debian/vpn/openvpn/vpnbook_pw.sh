https://www.vpnbook.com/#openvpn


<li><strong>Password:


curl -s 'https://www.vpnbook.com/#openvpn' | awk -F 'value=' '/<li><strong>Password:/ {print $2}' | cut -d "\"" -f2

# https://www.vpnbook.com/ password:
curl -s 'https://www.vpnbook.com/#openvpn' | awk -F 'Password:' '/<li><strong>Password:/ {print $2}' | cut -d " " -f2 | cut -d "<" -f1 | awk 'NR==1; END{print}'



# create vpn_password.txt
echo>vpn_password.txt vpnbook
curl -s 'https://www.vpnbook.com/#openvpn' | awk -F 'Password:' '/<li><strong>Password:/ {print $2}' | cut -d " " -f2 | cut -d "<" -f1 | head -n1>>vpn_password.txt