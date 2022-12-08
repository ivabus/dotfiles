#!/bin/sh
# Times the screen off and puts it to background
swayidle \
    timeout 10 'swaymsg "output * dpms off" && brightnessctl -d kbd_backlight set 0%' \
    resume 'swaymsg "output * dpms on" && brightnessctl -d kbd_backlight set 30%' &
# Locks the screen immediately
swaylock -c 073642
# Kills last background task so idle timer doesn't keep running
kill %%
