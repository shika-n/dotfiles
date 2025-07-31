#!/usr/bin/env bash

dirpath=$(dirname $0)

echo -n ${1/-/} > $dirpath/wallpaper_type

$dirpath/random_wallpaper.sh
