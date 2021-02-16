#!/bin/bash
#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

if [[ $HOSTNAME = "xps" ]]; then
    export HEIGHT=50
    export BORDER=5
    export FONT0="mono:pixelsize=26;1"
    export FONT1="Symbols Nerd Font:style=1000-em:pixelsize=26;1"
    export FONT2="Symbola:pixelsize=26;1"
    export MODULESL="bspwm spotify"
    export MODULESR="audiosource audiosink volume memory cpu wlan battery"
elif [[ $HOSTNAME = "grill" ]]; then
    export HEIGHT=24
    export BORDER=1
    export FONT0="mono:pixelsize=11;1"
    export FONT1="Symbols Nerd Font:style=1000-em:pixelsize=14;1"
    export FONT2="Symbola:pixelsize=9;1"
    export MODULESL="bspwm spotify"
    export MODULESR="audiosource audiosink volume memory cpu eth"
fi

export OFFSET="100%:-$HEIGHT"
export ETH_INTERFACE=$(ip link show | grep enp | sed 's/.*: \(.*\):.*/\1/')
export WLAN_INTERFACE=$(ip link show | grep wlp | sed 's/.*: \(.*\):.*/\1/')
green=$(xrdb -query | awk '/color2:/ {print $2}')
gray=$(xrdb -query | awk '/color8:/ {print $2}')
export RAMP0="%{F$green}▁%{F-}%{F$gray}▂▄▆█%{F-} "
export RAMP1="%{F$green}▁▂%{F-}%{F$gray}▄▆█%{F-} "
export RAMP2="%{F$green}▁▂▄%{F-}%{F$gray}▆█%{F-} "
export RAMP3="%{F$green}▁▂▄▆%{F-}%{F$gray}█%{F-} "
export RAMP4="%{F$green}▁▂▄▆█%{F-} "
export BATRAMP0="%{F$green}█%{F-}%{F$gray}████▮%{F-} "
export BATRAMP1="%{F$green}██%{F-}%{F$gray}███▮%{F-} "
export BATRAMP2="%{F$green}███%{F-}%{F$gray}██▮%{F-} "
export BATRAMP3="%{F$green}████%{F-}%{F$gray}█▮%{F-} "
export BATRAMP4="%{F$green}█████%{F-}%{F$gray}▮%{F-} "

for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar default & done

echo "Bars launched..."
