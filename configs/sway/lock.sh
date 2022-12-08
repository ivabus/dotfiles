#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off" && brightnessctl -d kbd_backlight set 0%' \
    resume 'swaymsg "output * dpms on" && brightnessctl -d kbd_backlight set 30%' &
# Locks the screen immediately
swaylock -i ~/.config/sway/magenta_blue.png -s stretch --font JetBrains\ Mono
# Kills last background task so idle timer doesn't keep running
kill %%
