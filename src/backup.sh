#!/bin/sh
set -ev

echo "Starting backup..."

restic backup "$CARBS_BACKUP_TARGETS" --exclude-file=/config/exclude.txt --verbose
echo "Backup complete."

echo "Pruning old snapshots..."

# For the last n months which have one or more snapshots,
# keep only the most recent k for each month.
restic forget --prune --keep-last "${CARBS_KEEP_LAST:-1}" --keep-monthly "${CARBS_KEEP_MONTHLY:-3}"
echo "Pruning complete."

echo "Checking backup for consistency..."
restic check
echo "Check complete."
