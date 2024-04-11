#!/bin/bash
source /home/pok/scripts/common.sh
lock_file="/home/pok/updating.flag"

if [ -f "$lock_file" ]; then
    echo "Update in progress by another instance. Skipping restart."
    exit 0
fi

# Check for updates
saved_build_id=$(get_build_id_from_acf)
current_build_id=$(get_current_build_id)

if [ -z "$saved_build_id" ] || [ "$saved_build_id" != "$current_build_id" ]; then
    if [ "${DISPLAY_POK_MONITOR_MESSAGE}" = "TRUE" ]; then
        echo "Update available."
    fi
    exit 0
else
    if [ "${DISPLAY_POK_MONITOR_MESSAGE}" = "TRUE" ]; then
        echo "No updates."
    fi
    exit 1
fi