#!/bin/bash

# Date
date_formatted=$(date "+%a %F %H:%M")

# Battery
bat_is_charging=$(cat /sys/class/power_supply/BAT0/status)
bat_percentage=$(cat /sys/class/power_supply/BAT0/capacity)
if [ $bat_percentage -ge 90 ]; then
    battery_status="   ${bat_percentage}%"
elif [ $bat_percentage -ge 70 ]; then
    battery_status=="   ${bat_percentage}%"
elif [ $bat_percentage -ge 50 ]; then
    battery_status="   ${bat_percentage}%"
elif [ $bat_percentage -ge 30 ]; then
    battery_status="   ${bat_percentage}%"
else
    battery_status="   ${bat_percentage}%"
fi
if [ $bat_is_charging == "Charging" ]; then
   battery_status=" ${bat_percentage}%" 
fi

# Volume
volume=$(pamixer --get-volume-human)
if [ $volume == "muted" ]; then
    volume="   $volume"
else
    volume="   $volume"
fi


# Brightness
brightness=$(brightnessctl -m | grep -oP '\d+(?=%)' | head -1)

# WLAN
wlan=$(iwgetid -r)

echo "  "$wlan"  |  "$volume"  |  "  $brightness"  |  "$battery_status"  |  " $date_formatted
