#!/bin/bash

read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
TOTAL1=$((user + nice + system + idle + iowait + irq + softirq + steal))
IDLE1=$((idle + iowait))

sleep 1

read cpu user nice system idle iowait irq softirq steal guest < /proc/stat
TOTAL2=$((user + nice + system + idle + iowait + irq + softirq + steal))
IDLE2=$((idle + iowait))

DIFF_TOTAL=$((TOTAL2 - TOTAL1))
DIFF_IDLE=$((IDLE2 - IDLE1))
CPU=$(( (100 * (DIFF_TOTAL - DIFF_IDLE)) / DIFF_TOTAL ))

TEMP=$(sensors | awk '/Package id 0:|Tdie/ {match($0, /\+[0-9]+\.[0-9]+/, m); print m[0]; exit}')

printf "CPU: %s%% (%s°C)\n" "$CPU" "$TEMP"
