#!/usr/bin/env bash
notify-send "Recording started"

file="$HOME/documents/recordings/$(date '+%F_%T_%:::z.mp4')"
monitor="$(hyprctl monitors -j | jq -r '.[] | select(.focused==true).name')"
case $1 in
no_audio)
	wf-recorder -f $file  -o $monitor
	;;
audio)
	wf-recorder -f $file --audio -o $monitor
	;;
region)
	case $2 in
	no_audio)
		wf-recorder -f $file -g "$(slurp)" -o $monitor
		;;
	audio)
		wf-recorder -f $file --audio -g "$(slurp)" -o $monitor
		;;
	esac
	;;
esac

