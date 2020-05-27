#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

export ETH_INTERFACE=$(ip link show | grep enp | sed 's/.*: \(.*\):.*/\1/')
export WLAN_INTERFACE=$(ip link show | grep wlp | sed 's/.*: \(.*\):.*/\1/')
green=$(xrdb -query | awk '/color2:/ {print $2}')
green2=$(xrdb -query | awk '/color8:/ {print $2}')
export RAMP0="%{F$green}▁%{F-}%{F$green2}▂▄▆█%{F-} "
export RAMP1="%{F$green}▁▂%{F-}%{F$green2}▄▆█%{F-} "
export RAMP2="%{F$green}▁▂▄%{F-}%{F$green2}▆█%{F-} "
export RAMP3="%{F$green}▁▂▄▆%{F-}%{F$green2}█%{F-} "
export RAMP4="%{F$green}▁▂▄▆█%{F-} "

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar default & done

echo "Bars launched..."
