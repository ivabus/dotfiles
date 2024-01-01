#!/bin/sh
# Times the screen off and puts it to background
grim /tmp/lockscreen.png && convert -filter Gaussian -resize 20% -blur 0x2.5 -resize 500% /tmp/lockscreen.png /tmp/lockscreen.png
swayidle \
    timeout 10 'swaymsg "output * dpms off" && brightnessctl -d kbd_backlight set 0%' \
    resume 'swaymsg "output * dpms on"' \
    before-sleep 'swaylock -i /tmp/lockscreen --font JetBrains\ Mono' &
# Locks the screen immediately
swaylock -i /tmp/lockscreen.png -s stretch --font JetBrains\ Mono
# Kills last background task so idle timer doesn't keep running
kill %%
rm /tmp/lockscreen.png
