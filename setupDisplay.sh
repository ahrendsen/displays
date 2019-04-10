
sudo apt update
sudo apt install net-tools openssh-server xdotool unclutter curl
crontab crontab.txt 
curl https://rclone.org/install.sh | sudo bash
sudo mv /etc/xdg/autostart/update-notifier.desktop /etc/xdg/autostart/update-notifier.desktop.old
sudo mv /etc/xdg/autostart/gnome-software-service.desktop /etc/xdg/autostart/gnome-software-service.desktop.old
