#!/usr/bin/env bash

pac=$(checkupdates | wc -l)
yay=$(yay -Qau | wc -l)
echo "$pac:$yay"
