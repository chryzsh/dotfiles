#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done



MONITOR=HDMI1 polybar bar1 & 
MONITOR=HDMI2 polybar bar1 &
# Launch bar1 and bar2
#polybar bar1 &

echo "Bars launched..."
