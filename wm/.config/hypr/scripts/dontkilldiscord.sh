if [[ $(hyprctl activewindow -j | jq -r ".class") == "Discord" ]]; then
	xdotool windowunmap $(xdotool getactivewindow)
else
	hyprctl dispatch killactive ""
fi
