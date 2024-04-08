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
wal -i "${files[$index]}" -q

waybarpath="$HOME/.config/waybar/style.css"
echo "Reloading waybar: $waybarpath"

touch "$waybarpath" -m

echo "Changing BetterDiscord theme."
wal-discord -t
