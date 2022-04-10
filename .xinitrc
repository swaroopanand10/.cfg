#!/bin/sh

sxhkd &
touchegg &
auto-cpufreq &
xset r rate 200 70
ly &

exec bspwm
