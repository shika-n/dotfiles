#!/usr/bin/env bash

dirpath=$(dirname $0)
base_folder="$HOME/Pictures/wallpapers/originals"
cache_folder="$HOME/Pictures/wallpapers/cache"
folders=('base' 'extra' 'extra_plus')

current_wallpaper=$(swww query | grep eDP-1 | cut -d ' ' -f 8)

ignore_args='-name *.conf -prune -o -name *_scaled* -prune -o'

file_arg=$(cat $(dirname $0)/wallpaper_type 2>/dev/null)

using_folder="$base_folder/${folders[0]}"

if [[ $file_arg == 'e' || $1 == '-e' ]] then
	using_folder="$base_folder/${folders[1]}"
elif [[ $file_arg == 'r' || $1 == '-r' ]]; then
	using_folder="$base_folder/${folders[2]}"
fi

wallpaper=$(find $using_folder $ignore_args -type f ! -name $(basename $current_wallpaper) -print | shuf -n 1)

scaled="${wallpaper%.*}_scaled.png"
if [[ -f $scaled ]] then
	wallpaper=$scaled
fi

wallpaper=$(${dirpath}/transform_wallpaper.sh "${wallpaper}" "$cache_folder")

swww img "${wallpaper}" --transition-type center --transition-duration 2

echo $wallpaper
