#!/bin/sh

swayidle -w \
  timeout 180 'swaylock -f -c 000000' \
  timeout 180 'swaymsg "output * power off"' resume 'swaymsg "output * power on"' \
  before-sleep 'swaylock -f -c 000000'
