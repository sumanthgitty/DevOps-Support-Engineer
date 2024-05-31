#!/bin/bash

# Default time threshold is 40 hours
TIME_THRESHOLD=${1:-40}

# Directory containing the audio files
AUDIO_DIR="/data/audios/folder"

# Log file with the name format deleted-files-<date>-<month>-<year>.log
LOG_FILE="deleted-files-$(date +%d-%m-%Y).log"

# Find and delete files older than the specified time threshold
find $AUDIO_DIR -name "*.wav" -type f -mmin +$((TIME_THRESHOLD * 60)) | while read FILE; do
    # Get the creation time in ISO 8601 format
    CREATION_TIME=$(stat -c %y "$FILE" | sed 's/ /T/' | sed 's/\..*/Z/')
    # Get the current time in ISO 8601 format
    DELETION_TIME=$(date --utc +%Y-%m-%dT%H:%M:%SZ)
    # Log the file details
    echo "$FILE $CREATION_TIME $DELETION_TIME" >> $LOG_FILE
    # Delete the file
    rm "$FILE"
done

echo "Cleanup completed. Log file created: $LOG_FILE"