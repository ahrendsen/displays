# Download the latest package lists.
sudo apt update

# Install some programs we'll need for the displays. 
echo "Install some programs we'll need for the displays."
yes | sudo apt install net-tools openssh-server xdotool unclutter curl ncdu
curl https://rclone.org/install.sh | sudo bash

# Copy over the auto-login configuration file.
echo "Copy over the auto-login configuration file."
sudo cp autoLogin.conf /etc/lightdm/lightdm.conf

# Add lines to the profile to be run at boot.
echo "Add lines to the profile to be run at boot."
cat profileAdditions.sh >> $HOME/.profile

# Copies over the apt configuration file that disables auto updates. 
echo "Copies over the apt configuration file that disables auto updates."
sudo cp 10periodic /etc/apt/apt.conf.d/10periodic

# Moves other files to a different location to disable auto updates.
echo "Moves other files to a different location to disable auto updates."
sudo mv /etc/xdg/autostart/update-notifier.desktop /etc/xdg/autostart/update-notifier.desktop.old
sudo mv /etc/xdg/autostart/gnome-software-service.desktop /etc/xdg/autostart/gnome-software-service.desktop.old

# Copies over the openbox configuration file that allows
# gpicview to run in fullscreen, then install that config file.
echo "Setting gpicview to fullscreen"
sudo cp lubuntu-rc.xml $HOME/.config/openbox/lubuntu-rc.xml
openbox --reconfigure

# Copies the configuration file for gpicview so that the
# default slide duration is changed to 10.
echo "Setting gpicview to 10s display time..."
echo "Creating directory..."
mkdir $HOME/.config/gpicview
echo "Created directory!"
echo "Copying configuration file..."
sudo cp gpicview.conf $HOME/.config/gpicview/gpicview.conf
echo "Copied configuration file!"
echo "Set gpicview to 10s display time!"

# Copies the xfce display power managment file into the proper directory.
echo "Turning off display auto turn-off..."
sudo cp xfce4-power-manager.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager
echo "Turned off display auto turn-off!"

echo "Enabling execution of bash scripts..."
chmod +x boxScript.sh
chmod +x reload.sh
echo "Enabled execution of bash scripts!"

echo "Moving bash scripts to proper locations..."
cp boxScript.sh $HOME/boxScript.sh
cp reload.sh $HOME/reload.sh
echo "Moved bash scripts to proper locations!"

echo "Installing the crontab file for unlphysics..." 
crontab crontab.txt 
echo "Installed the crontab file for unlphysics!" 
echo "Installing the crontab file for root..."
sudo crontab crontab_root.txt
echo "Installed the crontab file for root!"

echo " "
echo " "
echo "Now we setup the box account. First, type the"
echo "command 'su -c "rclone config"' at a terminal to"
echo "setup the cloud storage account for syncing."
echo " "
echo "  Follow the prompts that appear. "
echo " "
echo "Then we disable the power management."
echo "Click the menu button > Preferences > Power Manager"
echo " "
echo "  In the window that appears, select the "Display" tab "
echo "  and drag all sliders to the left so they display 'Never'"
echo "  and then press the button to turn the settings off"
echo " "
echo "Finally, don't forget to remove the sudo priveleges"
echo "for the unlphysics user."
echo " "

