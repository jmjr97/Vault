#!/usr/bin/env bash

# default config
sudo ufw default deny incoming
sudo ufw default allow outgoing

# add localsend
sudo ufw allow 53317/tcp comment 'LocalSend'
sudo ufw allow 53317/udp comment 'LocalSend'
