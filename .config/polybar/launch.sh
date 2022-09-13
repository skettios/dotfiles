#!/bin/bash

killall -q polybar

primary=($(xrandr | grep -i " connected" | grep -i " primary" | cut -d" " -f1))
secondary=($(xrandr | grep -i " connected" | grep -v " primary" |cut -d" " -f1))

echo $primary
echo $secondary

MONITOR=$primary polybar primary &
if [ "$secondary" != "$primary" ]; then
    MONITOR=$secondary polybar secondary &
fi

