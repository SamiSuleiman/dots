#!/bin/bash

function get_battery_status() {
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
    echo $battery_status
}

function get_network_status() {
    wlan=$(iwgetid -r)
    if [ -z $wlan ]; then
        echo "   Not connected"
    else
        echo "   $wlan"
    fi
}

function get_volume_status() {
    volume=$(pamixer --get-volume-human)
    if [ $volume == "muted" ]; then
        volume="   $volume"
    else
        volume="   $volume"
    fi
    echo $volume
}

function get_brightness_status() {
    brightness=$(brightnessctl -m | grep -oP '\d+(?=%)' | head -1)
    brightness="   $brightness%"
    echo $brightness
}

function get_date() {
    date=$(date "+%a %F | %H:%M")
    date="   $date"
    echo $date
}

function get_input_lang_status() {
    # get current language input
    input_lang=$(swaymsg -t get_inputs | jq 'map(select(has("xkb_active_layout_name")))[0].xkb_active_layout_name | . |= ascii_downcase' | sed 's/\"//g' | awk '{print $1}')
    echo $input_lang
}

date_formatted=$(get_date)
battery_status=$(get_battery_status)
volume=$(get_volume_status)
brightness=$(get_brightness_status)
wlan=$(get_network_status)
input_lang=$(get_input_lang_status)

echo ""$wlan"  |  "$volume"  |  "$brightness"  |  "$battery_status"  |  "$date_formatted"  |  "$input_lang" |"
