#!/bin/bash

function main() {
  # temp
  # temp=$(nvidia-settings -q gpucoretemp | grep Attribute | awk '{print $4}')
  temp=$(nvidia-settings -q gpucoretemp | grep Attribute | awk '{print ($4+0)}')

  echo "${temp}°C"
}

main
