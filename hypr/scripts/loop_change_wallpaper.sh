#!/usr/bin/env bash

dirpath=$(dirname $0)
while [[ true ]]; do
	if [[ ! -f "${dirpath}/wallpaper_paused" && -z $(pidof hyprlock) ]] then
		$dirpath/random_wallpaper.sh
		sleep $(cat "${dirpath}/wallpaper_change_interval")
	else
		sleep 5m
	fi
done

