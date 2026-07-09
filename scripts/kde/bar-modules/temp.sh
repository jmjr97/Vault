#!/usr/bin/env bash

function main() {
  action=$1

  # temp
  temp=$(sensors | grep Tctl | awk '{print substr($2,2);}')

  # icon
  if [[ $temp > 85 ]]; then
    temp_icon='!'
  elif [[ $temp > 70 ]]; then
    temp_icon=''
  elif [[ $temp > 55 ]]; then
    temp_icon=''
  elif [[ $temp > 40 ]]; then
    temp_icon=''
  else
    temp_icon=''
  fi

  # output
  if [ "${action}" == "icon" ]; then
    echo " $temp_icon"
  fi

  if [ "${action}" == "temp" ]; then
    echo "$temp "
	fi
}

main $@
