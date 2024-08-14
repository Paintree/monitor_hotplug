#!/bin/bash

#REQUIRES jq to work

PATH=$(pwd)
SCRIPT_PATH="/usr/local/bin"
RULE_PATH="/etc/udev/rules.d"

sudo cp $PATH$SCRIPT_PATH/switch_display.sh $SCRIPT_PATH
sudo cp $PATH$RULE_PATH/99-monitor-hotplug.rules $RULE_PATH

sudo chmod -x $SCRIPT_PATH/switch_display.sh

sudo udevadm control --reload-rules
sudo udevadm trigger
