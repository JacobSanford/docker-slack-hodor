#!/usr/bin/env sh

if [ "$SLACK_TOKEN" == "NULL" ]; then
  echo "The SLACK_TOKEN environment variable is not set!"
  exit 1
fi

echo "SLACK_TOKEN: $SLACK_TOKEN" >> /app/rtmbot.conf
./rtmbot.py
