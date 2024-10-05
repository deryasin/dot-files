#!/usr/bin/env bash

playerctl metadata -F -f '{{position}} {{mpris:length}}' | while read -r position length; do
    # Convert microseconds to seconds and round off
    position_sec=$(echo "scale=2; ($position / 1000000) + 0.5" | bc)
    position_sec=${position_sec%.*}  # Convert to integer by removing decimal part

    # Get formatted position string and player name
    positionStr=$(date -u -d "$position_sec" +'%T')
    player=$(playerctl metadata -f "{{playerName}}")

    # Create JSON using jq
    JSON_STRING=$(jq -n \
                  --arg pos "$position_sec" \
                  --arg len "$length" \
                  --arg posStr "$positionStr" \
                  --arg ply "$player" \
                  '{($ply): {position: $pos, positionStr: $posStr, length: $len}}')
    echo $JSON_STRING
done
