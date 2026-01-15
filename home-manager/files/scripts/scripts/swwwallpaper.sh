#!/usr/bin/env bash

wallpaperDir="$HOME/Pictures/Wallpapers/"

pick_random_wallpaper() {
    readlink -f "$(find "$wallpaperDir" -type l | shuf -n 1)"
}

# Get current resolved wallpaper path, if available
current_wallpaper="$(swww query 2>/dev/null | grep -m1 'currently displaying:' | awk -F'image: ' '{print $2}')"
current_wallpaper="$(readlink -f "$current_wallpaper")"

# Pick new wallpaper
wallpaper="$(pick_random_wallpaper)"

# Avoid duplicate
while [[ -n "$current_wallpaper" && "$wallpaper" == "$current_wallpaper" ]]; do
    wallpaper="$(pick_random_wallpaper)"
done

# --- Retry logic for setting wallpaper ---
max_retries=25
pause=2.5
delay=0.3

for ((i=1; i<=max_retries; i++)); do
  if swww query; then
    if [[ $1 == "start" ]]; then
      sleep $pause
    fi
    echo "Wallpaper set successfully on attempt $i"
    swww img "$wallpaper" --filter Nearest --transition-step 110 --transition-type center --transition-fps 60
    break
  else
    echo "Attempt $i failed, retrying in $delay seconds..."
    sleep $delay
  fi
done

# Convert the wallpaper for a secondary background file
mkdir -p ~/Pictures/Wallpapers/current
cp "${wallpaper}" ~/Pictures/Wallpapers/current/currentbg.gif
magick convert "${wallpaper}[0]" -scale "1920x1080^" ~/Pictures/Wallpapers/current/bg.png

