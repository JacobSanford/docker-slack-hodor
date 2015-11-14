#!/usr/bin/env bash

if [ -f /opt/hodorbot/rtmbot.conf ]; then
  echo "SLACK_TOKEN: \"$SLACK_TOKEN\"" >> /opt/hodorbot/rtmbot.conf
fi

cd /opt/hodorbot
./rtmbot.py
