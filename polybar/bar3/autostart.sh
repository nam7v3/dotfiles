#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/gruvbar.log
polybar -c $HOME/.config/polybar/bar3/grub.cfg dabar 2>&1 | tee -a /tmp/polybar.log & disown
echo "Bars launched..."
