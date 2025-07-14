#!/usr/bin/env bash

loaded=$(hyprctl hyprpaper listloaded)
arg=$(find ~/Pictures/wallpapers -type f | shuf -n 1)

hyprctl hyprpaper reload ", $arg"

