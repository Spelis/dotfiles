#!/bin/bash

# Your input text
text=$(hyprctl devices)

# Use grep with -oP to find all instances of "Keyboard at" followed by a string, and then remove newlines
keyboards=$(echo "$text" | awk '/Keyboard at/ {getline; print}')

# Loop through each keyboard and process it
for keyboard in $keyboards; do
	hyprctl switchxkblayout $keyboard next
done


kb=$(sh /home/elis/.config/waybar/getkb.sh)
echo $kb
notify-send "Keyboard Layout" "Switched Keyboard Layout to "$kb -a "System"
