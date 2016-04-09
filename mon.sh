#!/bin/bash

IN="eDP1"
EXT="DP1"

if (xrandr | grep "$EXT disconnected"); then
    xrandr --output $EXT --off --output $IN --auto
else
    xrandr --output $IN --off --output $EXT --auto
fi
