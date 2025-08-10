#!/usr/bin/env bash

dirpath=$(dirname $0)

if [[ ! -f "${dirpath}/wallpaper_paused" ]] then
	touch "${dirpath}/wallpaper_paused" && \
		notify-send 'Wallpaper paused!' -t 3000
else
	interval=$(cat ${dirpath}/wallpaper_change_interval)
	rm "${dirpath}/wallpaper_paused" && \
		notify-send "Wallpaper unpaused! (${interval})" -t 3000
fi
