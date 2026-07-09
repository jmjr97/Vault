#!/usr/bin/env bash

# hyprctl -j workspaces | grep -m2 tiled | tail -n1 | awk '{gsub(/"/, "", $2); print $2 }'

hyprctl eval 'hl.dispatch(hl.dsp.window.fullscreen({ mode = "maximized" }))'
