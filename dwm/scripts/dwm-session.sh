#!/bin/sh

SCRIPTS_PATH="$HOME/.local/bin"

# 1. Set Screen Resolution (Optional - xrandr is the X11 equivalent of wlr-randr)
# xrandr --output DP-1 --mode 2560x1440 --rate 144
$SCRIPTS_PATH/monitor_setup.sh &

# 2. Status Bar
slstatus &

#2. redshift
redshift &

# 3. Compositor (Fixes NVIDIA tearing/lag)
# You need to install this: sudo dnf install picom
picom -b --backend glx &

# 4. Wallpaper
# You need to install this: sudo dnf install feh
feh --bg-scale /home/henrique/Pictures/wallpapers/cozy_winter.jpg &


# 6. Start DWM (Must be last!)
exec dwm
