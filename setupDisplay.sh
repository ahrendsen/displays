# Download the latest package lists.
sudo apt update

# Install some programs we'll need for the displays. 
sudo apt install net-tools openssh-server xdotool unclutter curl
curl https://rclone.org/install.sh | sudo bash

# Copy over the auto-login configuration file.
sudo cp autoLogin.conf /etc/lightdm/lightdm.conf

# Add lines to the profile to be run at boot.
cat profileAdditions.sh >> $HOME/.profile

# Copies over the apt configuration file that disables auto updates. 
sudo cp 10periodic /etc/apt/apt.conf.d/10periodic

# Moves other files to a different location to disable auto updates.
sudo mv /etc/xdg/autostart/update-notifier.desktop /etc/xdg/autostart/update-notifier.desktop.old
sudo mv /etc/xdg/autostart/gnome-software-service.desktop /etc/xdg/autostart/gnome-software-service.desktop.old

# Copies over the openbox configuration file that allows
# gpicview to run in fullscreen, then install that config file.
sudo cp lubuntu-rc.xml $HOME/.config/openbox/lubuntu-rc.xml
openbox --reconfigure

# Copies the configuration file for gpicview so that the
# default slide duration is changed to 10.
sudo cp gpicview.conf $HOME/.config/gpicview/gpicview.conf

# Copies the xfce display power managment file into the proper directory.
sudo cp xfce4-power-manager.xml $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-power-manager

chmod +x boxScript.sh
chmod +x reload.sh

cp boxScript.sh $HOME/boxScript.sh
cp reload.sh $HOME/reload.sh

read -a ip -p \
"Enter the IP Address where the rclone config 
file is stored and press [Enter]: "
sudo scp unlphysics2@$ip:rclone.conf /root/.config/rclone/rclone.conf

crontab crontab.txt 
sudo crontab crontab_root.txt

echo "Now we setup the box account. First, type the"
echo "command 'su -c rclone config' at a terminal to"
echo "setup the cloud storage account for syncing."
echo ""
echo "  Follow the prompts that appear. "
echo ""
echo "Now click the menu button > Preferences > Power Manager"
echo ""
echo "  In the window that appears, select the "Display" tab "
echo "  and drag all sliders to the left so they display 'Never'"
echo "  and then press the button to turn the settings off"
echo ""
