#!/usr/bin/env bash

dirpath=$(dirname $0)
while [[ true ]]; do
	$dirpath/random_wallpaper.sh
	sleep $(cat $dirpath/wallpaper_change_interval)
done

