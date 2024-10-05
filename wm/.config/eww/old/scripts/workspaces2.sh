#! /bin/sh

#define icons for workspaces 1-9

while true; do
	python3 ./scripts/workspaces.py-old
done
#socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
#python3 ./scripts/workspaces.py
