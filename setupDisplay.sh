sudo apt update
sudo apt install net-tools openssh-server xdotool unclutter curl
curl https://rclone.org/install.sh | sudo bash
sudo cp autoLogin.conf /etc/lightdm/lightdm.conf
cat profileAdditions.sh >> $HOME/.profile
sudo cp 10periodic /etc/apt/apt.conf.d/10periodic
sudo mv /etc/xdg/autostart/update-notifier.desktop /etc/xdg/autostart/update-notifier.desktop.old
sudo mv /etc/xdg/autostart/gnome-software-service.desktop /etc/xdg/autostart/gnome-software-service.desktop.old
sudo mv lubuntu-rc.xml $HOME/.config/openbox/
openbox --reconfigure

chmod +x boxScript.sh
chmod +x reload.sh

cp boxScript.sh $HOME/boxScript.sh
cp reload.sh $HOME/reload.sh

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
echo "Then type 'gpicview' at a terminal to bring up the default"
echo "image viewer."
echo ""
echo "  In the box that appears, right click on the image and "
echo "  select 'preferences' from the menu. Set the time per slide"
echo "  to your desired setting. 10 seems to be good."
echo ""
echo ""
