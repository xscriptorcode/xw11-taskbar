#!/bin/bash

source "$CONFIG_DIR/icons.sh"

IP="$(ipconfig getifaddr en0 2>/dev/null)"

if [ "$IP" != "" ]; then
  sketchybar --set "$NAME" icon="$ICON_WIFI"
  sketchybar --set wifi.ip \
    icon="$ICON_WIFI" \
    label="IP: $IP"
else
  sketchybar --set "$NAME" icon="$ICON_WIFI_OFF"
  sketchybar --set wifi.ip \
    icon="$ICON_WIFI_OFF" \
    label="Disconnected"
fi
