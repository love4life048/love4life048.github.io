#!/bin/sh

tries=0
while [[ $tries -lt 5 ]]
do
	if ping -c 1 192.168.2.1 >/dev/null
	then
		exit 0
	fi
	tries=$((tries+1))
done

systemctl restart connman.service
sleep 2
systemctl restart wpa_supplicant.service
