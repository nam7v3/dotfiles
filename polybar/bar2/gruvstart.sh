#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/gruvbar.log
polybar -c grub.cfg dabar 2>&1 | tee -a /tmp/gruvbar.log & disown
echo "Bars launched..."
