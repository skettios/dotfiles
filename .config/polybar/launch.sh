#!/bin/bash

killall -q polybar

primary=($(xrandr | grep -i " connected" | grep -i " primary" | cut -d" " -f1))
secondary=($(xrandr | grep -i " connected" | grep -v " primary" | grep -v "HDMI" | cut -d" " -f1))
secondary_top=($(xrandr | grep -i " connected" | grep -v " primary" | grep -i "HDMI" | cut -d" " -f1))

echo $primary
echo $secondary
echo $secondary_top

if [ "$secondary" != "" ]; then
  MONITOR=$secondary polybar secondary &
fi
if [ "$secondary_top" != "" ]; then
  MONITOR=$secondary_top polybar secondary &
fi
MONITOR=$primary polybar primary &

