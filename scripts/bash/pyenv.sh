#!/bin/bash

echo 'Do you want to setup a Python Environment?'
read -p '[Y/n]' response

if [[ $response == '' ]] || [[ $response == 'y' ]] || [[ $response == 'Y' ]]; then
  python -m venv .env
  # echo 'Python environment created. Would you like to source it?'
  # read -p '[Y/n]' source
  # if [[ $response == '' ]] || [[ $response == 'y' ]] || [[ $response == 'Y' ]]; then
  #   source .env/bin/activate
  #   echo 'Environment activated.'
  # else
  #   echo 'Did not activate environment.'
  # fi
else
  echo 'Selected no.'
fi

echo 'Process Complete'
