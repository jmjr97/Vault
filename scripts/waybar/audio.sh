#!/bin/bash

# speakers='alsa_output.pci-0000_07_00.1.hdmi-stereo-extra1'
speakers='alsa_output.pci-0000_09_00.4.analog-stereo'
# headphones='alsa_output.usb-Logitech_PRO_000000000000-00.pro-output-0'
headphones='alsa_output.usb-Logitech_PRO_000000000000-00.analog-stereo'

SINK=$(pactl get-default-sink NAME)

function main() {
  action=$1

  if [ "${action}" == "get" ]; then
    if [ $(pactl get-default-sink) == $headphones ]; then
      echo 󰋋
    fi

    if [ $(pactl get-default-sink) == $speakers ]; then
      echo 󰓃
    fi
  fi

  if [ "${action}" == "swap" ]; then
    if [ ${SINK} == $headphones ]; then
      pactl set-default-sink $speakers 
      echo 󰓃
    else 
      pactl set-default-sink $headphones 
      echo 󰋋
    fi
  fi

  if [ "${action}" == "reset" ]; then
    systemctl --user restart pipewire
    i3-msg restart
  fi

}

main $@
