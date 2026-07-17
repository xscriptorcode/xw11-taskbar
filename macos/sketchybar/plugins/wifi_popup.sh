#!/bin/bash

IP="$(ipconfig getifaddr en0 2>/dev/null)"
INTERFACE="en0"

if [ "$IP" != "" ]; then
  sketchybar --set wifi.popup.ip \
    icon="󰩠" \
    icon.color=0xff5ad4e6 \
    label="IP: $IP" \
    popup.drawing=off

  sketchybar --set wifi.popup.ssid \
    icon="󰖩" \
    icon.color=0xff5ad4e6 \
    label="SSID: (redacted)" \
    popup.drawing=off

  sketchybar --set wifi.popup.interface \
    icon="󰚝" \
    icon.color=0xff5ad4e6 \
    label="Interface: $INTERFACE" \
    popup.drawing=off
else
  sketchybar --set wifi.popup.ip \
    icon="󰖪" \
    icon.color=0xfffc618d \
    label="IP: Disconnected" \
    popup.drawing=off

  sketchybar --set wifi.popup.ssid \
    icon="󰖪" \
    icon.color=0xfffc618d \
    label="Not connected" \
    popup.drawing=off

  sketchybar --set wifi.popup.interface \
    icon="󰚝" \
    icon.color=0xfffc618d \
    label="Interface: $INTERFACE" \
    popup.drawing=off
fi

sketchybar --animate tanh 10 --set wifi popup.drawing=toggle
