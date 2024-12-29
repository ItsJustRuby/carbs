#!/bin/sh
set -e

if [ ! -f "/config/rclone.conf" ]; then
    echo "You must mount an rclone config file at /config/rclone.conf."
    exit 2
fi

echo "Writing rclone config to file"
mkdir -p "$HOME/.config/rclone"
cp /config/rclone.conf "$HOME/.config/rclone/rclone.conf"
