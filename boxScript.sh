#!/bin/bash

# This first command basically is just trying to access
# Box to see if the internet connection is active.
# --low-level-retries 3 makes the command return
#   rather quickly instead of taking several seconds (~20) to 
#   respond.
rclone sync box:JHDisplay/ /home/unlphysics/display/ \
	--dry-run --low-level-retries 3 2>&1
if [ $? -gt 0 ] # The previously run command returned an error
	then	
	# Likely we're not connected to the internet, 
	# we need to reconnect
	echo "Restarting network manager..."
	service network-manager restart
	echo "Network manager restarted!"
fi
# Now we should be connected to the internet, record
# the number of files that have been changed. 
NUMCHANGEDFILES=$(rclone sync box:JHDisplay/ /home/unlphysics/display/ \
--dry-run --contimeout 15s 2>&1 | wc --lines)

# If any files were changed...
if [ $NUMCHANGEDFILES -gt 0 ]
	then
	# Download the file contents to the display,
	# changing the files that are currently on the 
	# device so that they match what is stored in Box.
	# --progress shows file transfer statistics so if 
	#   the script is being run interactively, the
	#   user can know that the script is working.
	# --transfers 1 limits the number of files that
	#   are simultaneously downloaded. One display 
	#   had trouble updating when this was set to 
	#   the default of 4, but seemed to have no 
	#   trouble when it was set to 1
	rclone sync box:JHDisplay/ /home/unlphysics/display/ --progress --transfers 1

	# Save an empty file that indicates that new slides 
	# have been downloaded and unlphysics should 
	# run its reload script.
	touch /home/unlphysics/reload
else
	echo "No files changed. Exiting..."
fi

# Automatically removal journal files that tend to take up lots of
# storage on the system.
rm /var/log/journal/*/system-1000*.journal*
rm /var/log/journal/*/system@*.journal*
rm /var/log/journal/*/user-1000*.journal*
