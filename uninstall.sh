#!/bin/bash

SCRIPT_PATH="/usr/local/bin"
RULE_PATH="/etc/udev/rules.d"

sudo rm $SCRIPT_PATH/switch_display.sh
sudo rm $RULE_PATH/99-monitor-hotplug.rules
