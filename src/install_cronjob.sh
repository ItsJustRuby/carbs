#!/bin/sh

if [ -z "${CARBS_CRONTAB}" ]; then
  echo "You must configure an env variable CARBS_CRONTAB."
  exit 1
fi

echo "Installing backup job using crontab of '${CARBS_CRONTAB}'"
# Take crontab from ENV variable and install it as a cronjob.
# Note that you can't just overwrite the current crontab file in place - this won't trigger crond to reload it.
echo "${CARBS_CRONTAB} /carbs/backup.sh >> /carbs/cron.log 2>&1" > ./new.crontab
crontab ./new.crontab

if [ -n "${CARBS_EXIT_ON_SUCCESS}" ]; then
  echo "Finished, exiting as configured (instead of starting cron daemon)."
  exit 0
fi

echo "Printing cronjob output to this terminal as well as as /carbs/cron.log..."
touch /carbs/cron.log
tail -f /carbs/cron.log &

# Run the cron daemon in the foreground, with log level 8, printing to stderr.
echo "Starting cron daemon"
/usr/sbin/crond -f -d 8
