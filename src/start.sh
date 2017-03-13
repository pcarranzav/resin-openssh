#!/bin/bash

# Start sshd if we don't use the init system
if [ "$INITSYSTEM" != "on" ]; then
  /usr/sbin/sshd -p 22 &
fi

ngrok authtoken $NGROK_AUTH_TOKEN
ngrok tcp --log stdout --log-format "json" 22 &

echo "This is where your application would start..."
while : ; do
  echo "waiting"
  curl "http://127.0.0.1:4040/api/tunnels"
  sleep 10
done
