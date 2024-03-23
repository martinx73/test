sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install ufw -y && sudo ufw default deny incoming && sudo ufw default allow outgoing && sudo ufw enable
sudo apt install xfdesktop4 xfwm4 xfce4-panel xfce4-settings xfce4-session xfce4-terminal thunar xfce4-whiskermenu-plugin xfce4-power-manager synaptic sshfs firefox-esr -y
sudo apt install xfce4-screenshooter xfce4-pulseaudio-plugin software-properties-common -y 
sudo apt-add-repository contrib non-free -y
sudo apt install network-manager -y && sudo apt install network-manager-gnome -y && sudo systemctl enable NetworkManager.service
sudo apt install unrar smplayer smplayer-l10n thunar-archive-plugin neofetch apt-transport-https curl git build-essential meson itstool libtool pkg-config intltool libicu-dev libpcre2-dev libglib2.0-dev libgtk-3-dev libxml2-utils -y
git clone https://github.com/cboxdoerfer/fsearch.git && cd fsearch/ && meson builddir && ninja -C builddir install
sudo apt install dirmngr  lsb-release ca-certificates -y    
mkdir ~/xremotox
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install sublime-text -y
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install google-chrome-stable -y
sudo nano /etc/network/interfaces
sudo reboot
