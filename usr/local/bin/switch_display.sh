#!/bin/bash

# Define your monitor and TV names
MONITOR="DP-1"
TV="HDMI-A-2"

MONITOR_AUDIO_SINK="alsa_output.usb-Topping_DX3_Pro_-00.HiFi__Headphones__sink"
TV_AUDIO_SINK="alsa_output.pci-0000_01_00.1.hdmi-stereo-extra1.8"

MONITOR_CONNECTED=$(kscreen-doctor -j | jq -r '.outputs[] | select(.name=="DP-1") | .connected')
echo $MONITOR_CONNECTED

if [ "$MONITOR_CONNECTED" == "true" ]; then
    # Monitor is connected, switch to it
    kscreen-doctor output.$TV.disable output.$MONITOR.enable
    pactl set-default-sink $MONITOR_AUDIO_SINK
else
    # Monitor is not connected, switch to TV
    kscreen-doctor output.$TV.enable
    pactl set-default-sink $TV_AUDIO_SINK
fi