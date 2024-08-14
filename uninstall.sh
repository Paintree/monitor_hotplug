#!/bin/bash

SCRIPT_PATH="/usr/local/bin"
RULE_PATH="/etc/udev/rules.d"
SERVICE_PATH="/etc/systemd/system"

systemctl disable switch_display.service

rm $SCRIPT_PATH/switch_display.sh
rm $RULE_PATH/99-monitor-hotplug.rules
rm $SERVICE_PATH/switch_display.service

systemctl daemon-reload

