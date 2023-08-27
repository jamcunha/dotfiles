#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1
echo "---" | tee -a /tmp/polybar.log

for m in $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f3 | cut -d"+" -f2 | cut -d"*" -f2); do
  echo "$m"
  MONITOR=$m polybar main 2>&1 | tee -a /tmp/polybar.log & disown
done

echo "Bars launched..."
