#!/bin/bash
# A simple script to start the Rclone WebDAV server and mount it to Finder
PORT=8081
DRIVE_NAME="MyCloud"

if ! lsof -i :$PORT > /dev/null; then
    echo "Starting $DRIVE_NAME Server on Port $PORT..."
    /opt/homebrew/bin/rclone serve webdav $DRIVE_NAME: --addr localhost:$PORT --vfs-cache-mode writes > /dev/null 2>&1 &
    sleep 3
else
    echo "$DRIVE_NAME Server is already running on port $PORT."
fi

echo "Mounting to Finder..."
osascript -e "mount volume \"http://localhost:$PORT\""
echo "Done! Server is running in the background."
