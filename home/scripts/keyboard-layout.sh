#!/usr/bin/env bash

# Ensure PATH includes necessary locations (adjust as needed for your NixOS setup)
export PATH=$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$HOME/.nix-profile/bin


# Check if we are in Niri and have the msg command
if command -v niri &> /dev/null; then
    # Get layout info from Niri
    layout_info=$(niri msg -j keyboard-layouts 2>/dev/null)
    
    if [[ -n "$layout_info" ]]; then
        # Parse JSON: names list and current_idx
        current_idx=$(echo "$layout_info" | jq '.current_idx')
        current_name=$(echo "$layout_info" | jq -r ".names[$current_idx]")
        
        # Format based on name
        if [[ "$current_name" == *"US"* ]]; then
            text="🇺🇸 US"
            tooltip="Layout: $current_name"
        elif [[ "$current_name" == *"Canadian"* || "$current_name" == *"CSA"* ]]; then
            text="🇨🇦 CA"
            tooltip="Layout: $current_name"
        elif [[ "$current_name" == *"Russian"* ]]; then
            text="🇷🇺 RU"
            tooltip="Layout: $current_name"
        elif [[ "$current_name" == *"Japanese"* ]]; then
            text="🇯🇵 JP"
            tooltip="Layout: $current_name"
        else
            text="⌨️  ${current_name:0:2}"
            tooltip="Layout: $current_name"
        fi
        
        echo "{\"text\":\"$text\", \"tooltip\":\"$tooltip\", \"class\":\"keyboard-layout\"}"
        exit 0
    fi
fi

# Fallback methods (e.g. system var)
if [[ -n "$XKB_DEFAULT_LAYOUT" ]]; then
    layout="$XKB_DEFAULT_LAYOUT"
else
    layout="us" # Ultimate fallback
fi

# Simple formatting for fallback
if [[ "$layout" == *"us"* ]]; then
    text="🇺🇸 US"
elif [[ "$layout" == *"ca"* ]]; then
    text="🇨🇦 CA"
else
    text="⌨️  $layout"
fi

echo "{\"text\":\"$text\", \"tooltip\":\"System Layout: $layout\", \"class\":\"keyboard-layout\"}"
