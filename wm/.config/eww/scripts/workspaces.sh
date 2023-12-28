#! /bin/sh

#define icons for workspaces 1-9
python3 ./scripts/workspaces.py
#2>&1 | while read -r line; do
#eww update workspaces='$line' -c ../
#done
#socat -u UNIX-CONNECT:/tmp/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | while read -r; do
#python3 ./scripts/workspaces.py
