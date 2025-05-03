#!/bin/bash

# Path to the GTK cursor theme configuration file (you may need to adjust this path)
GTK_CONFIG="$HOME/.config/gtk-3.0/settings.ini"

# Inotify to monitor changes to the cursor theme
while true; do
    # Fetch the current GTK cursor theme from the configuration file
    CURSOR_THEME=$(grep -Po "^gtk-cursor-theme-name=\K.*" "$GTK_CONFIG")
    CURSOR_SIZE=$(grep -Po "^gtk-cursor-theme-size=\K.*" "$GTK_CONFIG")
    
    echo hyprctl set-cursor "$CURSOR_THEME" $CURSOR_SIZE
    export XCURSOR_THEME="$CURSOR_THEME"
    export XCURSOR_SIZE="$CURSOR_SIZE"

    # Call hyprctl to set the cursor
    if [ -n "$CURSOR_THEME" ]; then
        hyprctl setcursor "$CURSOR_THEME" $CURSOR_SIZE
    fi
    inotifywait -e modify "$CURSOR_CONFIG"
done
