#!/usr/bin/env bash
eww update transparency=$1
value=$(echo "scale=2;$1/100" | bc)
value=$(echo "scale=2; 0.70+$value" | bc)
echo $value
for window in $(hyprctl clients -j | jq -r '.[].address'); do
	hyprctl setprop address:$window alpha $value lock
	hyprctl setprop address:$window alphainactive $value lock
	echo $window
done

