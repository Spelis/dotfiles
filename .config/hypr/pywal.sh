#!/bin/bash

# Specify the directory path
DIR="$HOME/.wallpaper"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist."
    exit 1
fi

if [[ $(cat $HOME/.config/theme/cur) == "light" ]]; then
    light=-l
fi

# Initialize an empty array to store the file names

files=()
cmd=""

# Iterate over all items in the directory
for file in "$DIR"/*; do
    # Check if the item is a file (not a directory)
    if [ -f "$file" ]; then
        # Add the file name to the array
        files+=("$file")
	cmd=$cmd"$file\0icon\x1f$file\n"
    fi
done


# Execute the Rofi command
if [ "$1" = "" ]; then
	file=$(echo -en "$cmd" | rofi -dmenu -config "$HOME/.config/rofi/theme.rasi")
else
	if [ $1 = "rand" ]; then
		file=$(find "${DIR}" -type f | shuf -n 1)
	else
		file="$DIR/$1";
	fi
fi

echo "${file#$DIR/}" > "$HOME/.config/theme/bg"

if [[ -n $file ]]; then
# Access and print the file at the calculated index
echo "switch background"
notify-send "Pywal" "Switched theme:\n$file" -i "$file" -a 'System'
swww img --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 "$file"


echo "Setting Color Scheme"
wal -i "$file" -n -a 0 $light

waybarpath="$HOME/.config/waybar/style.css"
echo "Reloading waybar: $waybarpath"

touch "$waybarpath" -m

echo "Changing BetterDiscord theme."
pywal-discord

echo "Changing Firefox theme."
pywalfox update

# literally had to generate the file myself because pywal wont :\

echo "Changing Hyprland Colors."
colors=$(cat $HOME/.cache/wal/colors)
colors=${colors//#/}
readarray -t color <<<"$colors"

echo ${y[0]}

hyprTheme=$HOME/.cache/wal/colors-hyprland.conf

echo '' > $hyprTheme
echo \$color0 = rgb\(${color[0]}\) >> $hyprTheme
echo \$color1 = rgb\(${color[1]}\) >> $hyprTheme
echo \$color2 = rgb\(${color[2]}\) >> $hyprTheme
echo \$color3 = rgb\(${color[3]}\) >> $hyprTheme
echo \$color4 = rgb\(${color[4]}\) >> $hyprTheme
echo \$color5 = rgb\(${color[5]}\) >> $hyprTheme
echo \$color6 = rgb\(${color[6]}\) >> $hyprTheme
echo \$color7 = rgb\(${color[7]}\) >> $hyprTheme
echo \$color8 = rgb\(${color[8]}\) >> $hyprTheme
echo \$color9 = rgb\(${color[9]}\) >> $hyprTheme
echo \$color10 = rgb\(${color[10]}\) >> $hyprTheme
echo \$color11 = rgb\(${color[11]}\) >> $hyprTheme
echo \$color12 = rgb\(${color[12]}\) >> $hyprTheme
echo \$color13 = rgb\(${color[13]}\) >> $hyprTheme
echo \$color14 = rgb\(${color[14]}\) >> $hyprTheme
echo \$color15 = rgb\(${color[15]}\) >> $hyprTheme

echo "changing oomox theme (GTK + QT)"

oomox-cli -o oomox ~/.cache/wal/colors-oomox
gsettings set org.gnome.desktop.interface gtk-theme 'oomox'

rofiTheme=$HOME/.config/rofi/colors/wal.rasi

echo '* {' > $rofiTheme
echo 'background: #'${color[0]}';' >> $rofiTheme
echo 'background-alt: #'${color[1]}';' >> $rofiTheme
echo 'foreground: #'${color[15]}';' >> $rofiTheme
echo 'selected: #'${color[3]}';' >> $rofiTheme
echo 'active: #'${color[4]}';' >> $rofiTheme
echo 'urgent: #'${color[5]}';' >> $rofiTheme
echo '}' >> $rofiTheme
# echo \$color6 = rgb\(${color[6]}\) >> $hyprTheme
# echo \$color7 = rgb\(${color[7]}\) >> $hyprTheme
# echo \$color8 = rgb\(${color[8]}\) >> $hyprTheme
# echo \$color9 = rgb\(${color[9]}\) >> $hyprTheme
# echo \$color10 = rgb\(${color[10]}\) >> $hyprTheme
# echo \$color11 = rgb\(${color[11]}\) >> $hyprTheme
# echo \$color12 = rgb\(${color[12]}\) >> $hyprTheme
# echo \$color13 = rgb\(${color[13]}\) >> $hyprTheme
# echo \$color14 = rgb\(${color[14]}\) >> $hyprTheme
# echo \$color15 = rgb\(${color[15]}\) >> $hyprTheme

else
	notify-send "Pywal" "Cancelled" -a 'System'

fi
