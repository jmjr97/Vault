#!/usr/bin/env bash

function main() {
  action=$1

  # drives
  root=$(df -H | grep /dev/nvme0n1p2 | awk '{print $5}')
  home=$(df -H | grep /dev/nvme0n1p3 | awk '{print $5}')
  games=$(df -H | grep /dev/sdb1 | awk '{print $5}')
  storage=$(df -H | grep /dev/sda1 | awk '{print $5}')

  if [ "${action}" == "root" ]; then
    echo "$root "
  elif [ "${action}" == "home" ]; then
    echo "$home"
  elif [ "${action}" == "games" ]; then
    echo "$games "
  elif [ "${action}" == "storage" ]; then
    echo "$storage"
  fi
}

main $@
