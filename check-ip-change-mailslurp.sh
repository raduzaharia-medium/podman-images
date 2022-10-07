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
    curl -H "x-api-key: <YOUR_API_KEY>" -H "Content-Type: application/json" -X POST -d '{"to": ["your_email@domain.com"], "subject": "Public IP changed", "body": "New IP: $detectedIpAddress"}' https://api.mailslurp.com/inboxes/YOUR_INBOX_ID
    echo $detectedIpAddress > /tmp/ipaddress
fi
