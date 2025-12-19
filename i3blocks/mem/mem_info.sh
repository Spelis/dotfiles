#!/bin/bash

total_kb=$(grep MemTotal /proc/meminfo | awk '{print $2}')
avail_kb=$(grep MemAvailable /proc/meminfo | awk '{print $2}')

used_kb=$((total_kb - avail_kb))

used_gb=$(echo "scale=1; $used_kb/1024/1024" | bc)
total_gb=$(echo "scale=1; $total_kb/1024/1024" | bc)
used_pct=$(( used_kb * 100 / total_kb ))

printf "MEM: %s/%sGB (%s%%)\n" "$used_gb" "$total_gb" "$used_pct"
