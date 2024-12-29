#!/bin/sh
set -ev
# Meant for manual testing / paranoia only, not for automated use.

if [ -z "${CARBS_PATH}" ]; then
  echo "You must configure a CARBS_PATH for the remote."
  exit 8
fi

CARBS_REMOTE=$(rclone config dump | jq -r 'to_entries[0]["key"]')

export RESTIC_REPOSITORY="rclone:$CARBS_REMOTE:$CARBS_PATH"

mkdir -p restore
restic restore latest ./restore
