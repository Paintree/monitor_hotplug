#!/bin/bash

#REQUIRES jq to work

PROJECT_PATH=$(pwd)
SCRIPT_PATH="/usr/local/bin"
RULE_PATH="/etc/udev/rules.d"
SERVICE_PATH="/etc/systemd/system"

cp $PROJECT_PATH$SCRIPT_PATH/switch_display.sh $SCRIPT_PATH
cp $PROJECT_PATH$RULE_PATH/99-monitor-hotplug.rules $RULE_PATH
cp $PROJECT_PATH$SERVICE_PATH/switch_display.service $SERVICE_PATH

chmod +x $SCRIPT_PATH/switch_display.sh

udevadm control --reload-rules
udevadm trigger

systemctl daemon-reload
systemctl enable switch_display.service
