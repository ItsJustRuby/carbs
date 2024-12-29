#!/bin/sh
set -e

# shellcheck source-path=SCRIPTDIR
. "$(dirname "$0")/install_rclone.sh"
# shellcheck source-path=SCRIPTDIR
. "$(dirname "$0")/install_restic.sh"
# shellcheck source-path=SCRIPTDIR
. "$(dirname "$0")/install_cronjob.sh"
