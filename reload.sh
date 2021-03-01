#!/bin/bash

# If any files were changed...
if [ -f reload ]
	then
        # Stop the currently running slideshow
        kill $(ps -e | grep gpicview | awk '{print $1;}')
        
        # Setup the monitor to display any subsequent commands
        export DISPLAY=:0

        # Start a new slideshow to display all of the new content.
        gpicview /home/unlphysics/display --slideshow &

	# Remove the reload flag file so that it doesn't 
	# reload constantly. 
	rm /home/unlphysics/reload
fi
