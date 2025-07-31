#!/usr/bin/env bash

base_folder="$HOME/Pictures/wallpapers/originals"
folders=("base" "extra" "extra_plus")

current_wallpaper=$(swww query | grep eDP-1 | cut -d " " -f 5)

$ignore_args="-name _scaled -prune -o"

using_folder="$base_folder/${folders[0]}"
if [[ $# -gt 0 ]] then
	if [[ $1 == '-e' ]] then
		using_folder="$base_folder/${folders[1]}"
	elif [[ $1 == '-r' ]]; then
		using_folder="$base_folder/${folders[2]}"
	fi
fi

wallpaper=$(find $using_folder $ignore_args -type f ! -name $(basename $current_wallpaper) -print | shuf -n 1)

scaled="${wallpaper%.*}_scaled.png"
if [[ -f $scaled ]] then
	wallpaper=$scaled
fi

swww img $wallpaper --transition-type center --transition-duration 2

