#!/usr/bin/env bash
TEXT=$(wl-paste)
DAEMON_FILE=/run/user/1000/.ydotool_socket
echo $DAEMON_FILE
ls $DAEMON_FILE
if [[ "$(pgrep ydotoold)" == "" ]]; then
	notify-send "daemon not active"
	exit 1
else
	notify-send "typing clipboard..."
fi

sleep 3
ydotool type "$TEXT"
notify-send "FINISH"
