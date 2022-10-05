#! /bin/bash

detectedIpAddress=`curl -s checkip.dyndns.org | sed -e 's/.*Current IP Address: //' -e 's/<.*$//'`

if [ -z "$detectedIpAddress" ];
then
    exit 0
fi
if test -f /tmp/ipaddress
then
    previousIpAddress=`cat /tmp/ipaddress`
else
    previousIpAddress="0.0.0.0"
fi
if [ "$detectedIpAddress" != "$previousIpAddress" ]
then
    echo "New IP: $detectedIpAddress" | email -f from@address.com -n "From name" -s "Public IP changed" -r smtp.server.com -p 587 -u user@server.com -i "password" to@address.com /dev/stdin
    echo $detectedIpAddress > /tmp/ipaddress
fi
