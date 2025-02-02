#!/usr/bin/env bash

wallpaperDir=$HOME/Pictures/Wallpapers/
# chromeDir=$HOME/.zen/x3c3na4u.Default\ \(alpha\)/chrome/
# browser="zen-browser"
# service="zen-bin"
# class="zen-beta"

wallpaper="$(find ${wallpaperDir} -type l | shuf -n 1)"
echo "${wallpaper}"

# swww img ${wallpaper} --filter Nearest --transition-step 110 --transition-type center --transition-fps 60

# /home/s3mango/.local/share/bin/set_firefox_tab_bg.sh "${wallpaper}" "${chromeDir}" &

# result=$(hyprctl clients -j | jq --arg class "$class" '[.[].class == $class] | any')

# if [ "${result}" == "true" ]; then
#     log_debug "Killing ${service}"
#     pkill "${service}"
#     "${browser}"
# fi
