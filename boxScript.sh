#!/bin/bash

NUMCHANGEDFILES=$(rclone sync box:JHDisplay/ /home/unlphysics/display/ \
--dry-run 2>&1 | wc --lines)
# If any files were changed...
if [ $NUMCHANGEDFILES -gt 0 ]
	then
	# Download the file contents to the display,
	# changing the files that are currently on the 
	# device so that they match what is stored in Box.
	echo "Files have been changed! Downloading..."
        rclone sync -P box:JHDisplay/ /home/unlphysics/display/
	echo "Files downloaded"

	# Save an empty file that indicates that new slides 
	# have been downloaded and unlphysics should 
	# run its reload script.
	echo "Setting flag for file reload..."
	touch /home/unlphysics/reload
	echo "Set flag for file reload!"
fi
