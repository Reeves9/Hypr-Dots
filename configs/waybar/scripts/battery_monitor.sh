#!/bin/bash

while true; do
    battery_percent=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | awk '{print $2}')

    if [[ $battery_percent -le 20 ]]; then
        notify-send --urgency=critical "Battery Low: $battery_percent%" "Please connect your charger soon."
    elif [[ $battery_percent -le 10 ]]; then
        notify-send --urgency=critical "Battery Critical: $battery_percent%" "Battery is running out. Connect charger immediately."
    elif [[ $battery_percent -le 5 ]]; then
        notify-send --urgency=critical "Battery Extremely Low: $battery_percent%" "System may shut down soon. Connect charger immediately."
    fi

    sleep 60  # Check every minute
done

