#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off" && brightnessctl -d kbd_backlight set 0%' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -c 181924 --font JetBrains\ Mono' &
# Locks the screen immediately
swaylock -c 181924 -s stretch --font JetBrains\ Mono
# Kills last background task so idle timer doesn't keep running
kill %%
