#!/bin/sh
DaySuffix() {
	case $(date +%-d) in
	1 | 21 | 31) echo "st" ;;
	2 | 22) echo "nd" ;;
	3 | 23) echo "rd" ;;
	*) echo "th" ;;
	esac
}
#date=$(date "+%A %-d$(DaySuffix) %B %Y - %H:%M")
date=$(date "+%H:%M")
icon=""
printf "%s" "$date"
