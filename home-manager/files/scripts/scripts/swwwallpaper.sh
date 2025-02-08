#!/usr/bin/env bash

wallpaperDir=$HOME/Pictures/Wallpapers/

wallpaper="$(find ${wallpaperDir} -type l | shuf -n 1)"
echo "${wallpaper}"

swww img ${wallpaper} --filter Nearest --transition-step 110 --transition-type center --transition-fps 60

magick convert ${wallpaper}[0] -scale "1920x1080^" ~/.config/rofi/background.png 

# result=$(hyprctl clients -j | jq --arg class "$class" '[.[].class == $class] | any')

# if [ "${result}" == "true" ]; then
#     log_debug "Killing ${service}"
#     pkill "${service}"
#     "${browser}"
# fi
