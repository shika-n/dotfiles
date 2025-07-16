#!/usr/bin/env bash

wallpaper_folder=~/Pictures/wallpapers

current_wallpaper=$(hyprctl hyprpaper listactive | grep eDP-1 | cut -d " " -f 3)

exclude_arg="-path $wallpaper_folder/extra -prune -o"

if [[ $# -gt 0  && $1 == '-e' ]] then
	wallpaper_folder=$wallpaper_folder/extra
	unset exclude_arg
fi

wallpaper=$(find $wallpaper_folder $exclude_arg -type f ! -name $(basename $current_wallpaper) -print | shuf -n 1)

hyprctl hyprpaper reload ", $wallpaper"

