#!/usr/bin/env bash

killall -q polybar

echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar clock 2>&1 | tee -a /tmp/polybar1.log & disown
polybar ws 2>&1 | tee -a /tmp/polybar2.log & disown
polybar sys 2>&1 | tee -a /tmp/polybar3.log & disown
echo "Bars launched..."
