#!/bin/bash
# Generate a random index
INDEX=$RANDOM

# Specify the directory path
DIR="$HOME/.wallpaper"

# Check if the directory exists
if [ ! -d "$DIR" ]; then
    echo "Directory $DIR does not exist."
    exit 1
fi

# Initialize an empty array to store the file names
files=()

# Iterate over all items in the directory
for file in "$DIR"/*; do
    # Check if the item is a file (not a directory)
    if [ -f "$file" ]; then
        # Add the file name to the array
        files+=("$file")
    fi
done

# Calculate the modulo of the random index with the array length to ensure it's within bounds
index=$((INDEX % ${#files[@]}))

# Access and print the file at the calculated index
echo "switch background"
swww img --transition-type grow --transition-pos 0.8,0.9 --transition-step 90 "${files[$index]}"

echo "Setting Color Scheme"
wal -i "${files[$index]}" -q -a 0

waybarpath="$HOME/.config/waybar/style.css"
echo "Reloading waybar: $waybarpath"

touch "$waybarpath" -m

echo "Changing BetterDiscord theme."
pywal-discord

pywalfox update

# literally had to generate the file myself because pywal wont :\

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

oomox-cli -o oomox ~/.cache/wal/colors-oomox
gsettings set org.gnome.desktop.interface gtk-theme 'oomox'


