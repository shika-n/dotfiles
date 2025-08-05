#!/usr/bin/env bash

dirpath=$(dirname $0)

if [[ ! -f "${dirpath}/wallpaper_paused" ]] then
	touch "${dirpath}/wallpaper_paused" && notify-send 'Wallpaper paused!' -t 3000
else
	rm "${dirpath}/wallpaper_paused" && notify-send "Wallpaper unpaused! ($(cat ${dirpath}/wallpaper_change_interval))" -t 3000
fi
