#!/usr/bin/env bash

# Bluetooth menu using wofi
# This script provides a nice interface for managing Bluetooth devices

# Get Bluetooth status
bluetooth_status=$(bluetoothctl show | grep "Powered" | awk '{print $2}')

# Get list of paired devices
get_paired_devices() {
    bluetoothctl devices Paired | while read -r _ mac name; do
        # Check if device is connected
        if bluetoothctl info "$mac" | grep -q "Connected: yes"; then
            echo "󰂱 $name (Connected)|disconnect|$mac"
        else
            echo "󰂯 $name|connect|$mac"
        fi
    done
}

# Build menu options
menu_options=""

# Add power toggle
if [ "$bluetooth_status" = "yes" ]; then
    menu_options+="󰂲 Turn Bluetooth Off|power-off|\n"
else
    menu_options+="󰂯 Turn Bluetooth On|power-on|\n"
fi

# Add scan option if Bluetooth is on
if [ "$bluetooth_status" = "yes" ]; then
    menu_options+="󰐾 Scan for Devices|scan|\n"
    menu_options+="---\n"
    
    # Add paired devices
    while IFS= read -r device; do
        menu_options+="$device\n"
    done < <(get_paired_devices)
fi

# Show menu with wofi
selected=$(echo -e "$menu_options" | wofi --dmenu --prompt "Bluetooth" --insensitive --cache-file=/dev/null | head -n 1)

# Exit if nothing selected
[ -z "$selected" ] && exit 0

# Parse selection
action=$(echo "$selected" | cut -d'|' -f2)
mac=$(echo "$selected" | cut -d'|' -f3)

# Execute action
case "$action" in
    "power-on")
        bluetoothctl power on
        notify-send "Bluetooth" "Bluetooth turned on" -i bluetooth
        ;;
    "power-off")
        bluetoothctl power off
        notify-send "Bluetooth" "Bluetooth turned off" -i bluetooth
        ;;
    "scan")
        notify-send "Bluetooth" "Scanning for devices..." -i bluetooth
        bluetoothctl scan on &
        sleep 10
        bluetoothctl scan off
        
        # Show available devices
        devices=$(bluetoothctl devices | while read -r _ device_mac device_name; do
            echo "$device_name|pair|$device_mac"
        done)
        
        selected_device=$(echo -e "$devices" | wofi --dmenu --prompt "Select device to pair" --insensitive --cache-file=/dev/null)
        
        if [ -n "$selected_device" ]; then
            device_mac=$(echo "$selected_device" | cut -d'|' -f3)
            notify-send "Bluetooth" "Pairing with device..." -i bluetooth
            bluetoothctl pair "$device_mac"
            bluetoothctl trust "$device_mac"
            bluetoothctl connect "$device_mac"
        fi
        ;;
    "connect")
        bluetoothctl connect "$mac"
        device_name=$(bluetoothctl devices | grep "$mac" | cut -d' ' -f3-)
        notify-send "Bluetooth" "Connected to $device_name" -i bluetooth
        ;;
    "disconnect")
        bluetoothctl disconnect "$mac"
        device_name=$(bluetoothctl devices | grep "$mac" | cut -d' ' -f3-)
        notify-send "Bluetooth" "Disconnected from $device_name" -i bluetooth
        ;;
esac
