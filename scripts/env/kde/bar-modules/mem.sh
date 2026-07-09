#!/usr/bin/env bash

# memory
mem=$(free -m | grep Mem | awk '{print $3/1024}' | bc -l | xargs printf "%0.2f")

echo "${mem}GB "
