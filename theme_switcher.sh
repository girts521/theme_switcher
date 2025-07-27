#!/bin/bash

# --- theme-switcher.sh ---
# A script to set a new wallpaper and apply its color scheme system-wide.

# Check if a directory was provided
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/wallpaper/directory"
    exit 1
fi

WALLPAPER_DIR=$1

# 1. Select a random wallpaper from the directory
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

if [ -z "$WALLPAPER" ]; then
    echo "No wallpapers found in $WALLPAPER_DIR"
    exit 1
fi

echo "Changing theme to: $WALLPAPER"

# 2. Run pywal to generate color scheme
#    -q for quiet, -n to skip setting the wallpaper (we'll use swww)
#    -i specifies the image
wal -q -n -i "$WALLPAPER"

echo "$WALLPAPER"

# 3. Set the wallpaper using swww
#    --transition-type is optional, but adds a nice effect
swww img $WALLPAPER --transition-type any --transition-fps 60
sleep 4
# 4. Reload critical applications to apply the new theme
hyprctl reload
# Add a small delay for Waybar to catch up
sleep 0.5
pkill waybar && waybar &

# 5. (Optional) Send a notification
notify-send "Theme Changed" "New theme applied from $(basename "$WALLPAPER")"

echo "Theme switched successfully."
