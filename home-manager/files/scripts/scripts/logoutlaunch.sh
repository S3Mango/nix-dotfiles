#!/usr/bin/env sh


#// Check if wlogout is already running

if pgrep -x "wlogout" > /dev/null
then
    pkill -x "wlogout"
    exit 0
fi

wLayout="~/.config/wlogout/layout_2"
wlStyle="${confDir}/wlogout/style_2.css"

#// launch wlogout

wlogout -b "2" -c 0 -r 0 -m 0 --layout "${wLayout}" --css <(echo "${wlStyle}") --protocol layer-shell

