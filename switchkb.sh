#!/bin/bash

text=$(hyprctl devices)

keyboards=$(echo "$text" | awk '/Keyboard at/ {getline; print}')

for keyboard in $keyboards; do
	hyprctl switchxkblayout $keyboard next
done


keymap=$(hyprctl devices | awk '
  BEGIN { in_keyboard=0; count=0 }
  /Keyboards:/ { in_keyboard=1; next }
  /Tablets/ { exit }
  in_keyboard {
    gsub(/\t/, "", $0)
    if ($1 == "active" && $2 == "keymap:") {
      print $3
      exit
    }
  }
')

notify-send -t 750 "$keymap"
