#!/usr/bin/env bash

wallpaperDir="$HOME/Pictures/Wallpapers/"

if [[ -n $(swww query) ]]; then
  # Extract current wallpaper filename, ensuring no duplicates
  current_wallpaper="$(swww query | grep -m 1 'currently displaying: image:' | awk '{print $8}' | awk -F'/' '{print $NF}')"
  current_wallpaper=$(echo "$current_wallpaper" | tr -d '\n' | awk '!seen[$0]++')  # Remove duplicates

  # Select a random wallpaper
  wallpaperFile="$(find "$wallpaperDir" -type l | shuf -n 1 | awk -F'/' '{print $NF}')"
  wallpaperFile=$(echo "$wallpaperFile" | tr -d '\n')

  # Ensure new wallpaper is different
  while [[ "$wallpaperFile" == "$current_wallpaper" ]]; do
    wallpaperFile="$(find "$wallpaperDir" -type l | shuf -n 1 | awk -F'/' '{print $NF}')"
    wallpaperFile=$(echo "$wallpaperFile" | tr -d '\n')
  done

  # Construct full path
  wallpaper="${wallpaperDir}${wallpaperFile}"
else
  wallpaperFile="$(find "$wallpaperDir" -type l | shuf -n 1 | awk -F'/' '{print $NF}')"
  wallpaper="${wallpaperDir}${wallpaper}"
fi

# Set the new wallpaper
swww img "$wallpaper" --filter Nearest --transition-step 110 --transition-type center --transition-fps 60

# Convert the wallpaper for a secondary background file
mkdir -p ~/Pictures/Wallpapers/current
cp "${wallpaper}" ~/Pictures/Wallpapers/current/currentbg.gif
magick convert "${wallpaper}[0]" -scale "1920x1080^" ~/Pictures/Wallpapers/current/bg.png

