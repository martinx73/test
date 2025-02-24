sudo apt install apt-transport-https bleachbit build-essential ca-certificates curl default-jre dirmngr firefox-esr intltool itstool libglib2.0-dev libgtk-3-dev libicu-dev libpcre2-dev libtool libxml2-utils lsb-release meson neofetch network-manager network-manager-gnome pkg-config smplayer smplayer-l10n software-properties-common sshfs synaptic thunar thunar-archive-plugin ufw  xfce4-appfinder xfce4-battery-plugin xfce4-clipman xfce4-clipman-plugin xfce4-datetime-plugin xfce4-indicator-plugin xfce4-notifyd xfce4-panel xfce4-power-manager xfce4-power-manager-plugins xfce4-pulseaudio-plugin xfce4-screenshooter xfce4-session xfce4-settings xfce4-taskmanager xfce4-terminal xfce4-whiskermenu-plugin xfconf xfdesktop4 xfwm4 libreoffice-gtk3 python3-software-properties freerdp2-x11 -y
sudo apt-add-repository contrib non-free -y
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install unrar sublime-text google-chrome-stable -y
curl -fsS https://dl.brave.com/install.sh | sh
mkdir ~/xremotox
sudo mkdir /mnt/data/
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable
sudo systemctl enable NetworkManager.service
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
#echo 'UUID="A20EB1550EB12369" /mnt/data/ ntfs 0 2' | sudo tee -a /etc/fstab
sudo reboot
