#!/bin/bash

WORKSPACE=$(hyprctl activeworkspace | awk '/workspace ID/ {print $3}')
if [[ $WORKSPACE -gt 10 ]]; then
	WORKSPACE=$(($WORKSPACE - 10))
fi

if [[ $1 = "J" ]]; then
	WORKSPACE=$(($WORKSPACE - 1))

    if [[ $WORKSPACE = 0 ]]; then
        hyprctl dispatch split:movetoworkspace emptynm
    else
        hyprctl dispatch split:movetoworkspace $WORKSPACE
    fi

elif [[ $1 = "K" ]]; then
	WORKSPACE=$(($WORKSPACE + 1))
    
    if [[ $WORKSPACE = 11 ]]; then
        hyprctl dispatch split:movetoworkspace 1
    else
        hyprctl dispatch split:movetoworkspace $WORKSPACE
    fi

fi
