#!/usr/bin/env bash

dirpath=$(dirname $0)
retransform=${1:-false}
base_folder="$HOME/Pictures/wallpapers/originals"
cache_folder="$HOME/Pictures/wallpapers/.cache"
folders=('base' 'extra' 'extra_plus')

current_wallpaper=$(swww query | grep eDP-1 | cut -d ' ' -f 9)

file_arg=$(cat $(dirname $0)/wallpaper_type 2>/dev/null)

using_folder="$base_folder/${folders[0]}"

if [[ $file_arg == 'e' || $1 == '-e' ]] then
	using_folder="$base_folder/${folders[1]}"
elif [[ $file_arg == 'r' || $1 == '-r' ]]; then
	using_folder="$base_folder/${folders[2]}"
fi

if [[ ${retransform} == true ]] then
	wallpaper=$(find $using_folder \
		-name *.conf -prune -o \
		-name *.scaled.* -prune -o \
		-name *.src.* -prune -o \
		-type f -name $(basename $current_wallpaper) -print | shuf -n 1 \
	)
	notify-send "Retransform current wallpaper" -t 3000
else
	wallpaper=$(find $using_folder \
		-name *.conf -prune -o \
		-name *.scaled.* -prune -o \
		-name *.src.* -prune -o \
		-type f ! -name $(basename $current_wallpaper) -print | shuf -n 1 \
	)
fi

scaled="${wallpaper%.*}.scaled.png"
if [[ -f $scaled ]] then
	wallpaper=$scaled
fi

wallpaper=$(${dirpath}/transform_wallpaper.sh \
	"${wallpaper}" "$cache_folder" "${retransform}" \
)

ln -sf "${wallpaper}" "${cache_folder}/current"

swww img "${wallpaper}" --transition-type center --transition-duration 2

echo $wallpaper
