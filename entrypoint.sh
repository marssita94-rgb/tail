#!/bin/sh
set -e

# Start Tailscale daemon
tailscaled --tun=userspace-networking &

# Authenticate
tailscale up --authkey=$TAILSCALE_AUTH_KEY \
             --hostname=$TAILSCALE_HOSTNAME \
             --advertise-tags=$TAILSCALE_EXTRA_ARGS

# Wait a bit for connection
sleep 5

# Show status
tailscale status

# Start your app
exec /start-app.sh
