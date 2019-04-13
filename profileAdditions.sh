###
# This starts a program that automatically hides
# the mouse when it is inactive.
###
unclutter & 

###
# Disables Display power mangaement
# settings so the screen won't blank.
###
xset s off && sxet -dpms

###
# Automatically launches slideshow program
# after waiting 15 seconds for the computer
# to boot up.
###
export DISPLAY=:0
sleep 5 && gpicview /home/unlphysics/display --slideshow&
