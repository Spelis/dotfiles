#!/bin/bash

ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)
localip=$(ip route get 1.1.1.1 | awk '{print $7; exit}')
publicip=$(curl -s http://spelis.projnull.eu:80/myip)

if [ -n "$ssid" ]; then
    echo "<span foreground='#b8bb26'>W: $localip ($publicip)</span>"
else
    echo "<span foreground='#fb4934'>No Internet</span>"
fi
