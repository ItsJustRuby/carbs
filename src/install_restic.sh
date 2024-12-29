#!/bin/sh

if [ -z "${CARBS_BACKUP_TARGETS}" ]; then
  echo "You must configure CARBS_BACKUP_TARGETS."
  exit 4
fi

if [ -z "${CARBS_PATH}" ]; then
  echo "You must configure a CARBS_PATH for the remote."
  exit 8
fi

CARBS_REMOTE=$(rclone config dump | jq -r 'to_entries[0]["key"]')

# Magic env var for restic to access
export RESTIC_REPOSITORY="rclone:$CARBS_REMOTE:$CARBS_PATH"

echo "Checking if repository exists..."
restic cat config > /dev/null
REPOSITORY_EXISTS=$?

if [ "$REPOSITORY_EXISTS" -ne 0 ]
then
    echo "It does not, initializing..."
    restic init
else
    echo "It does, continuing."
fi

# Create ignorefile if it does not already exist
touch /config/exclude.txt
