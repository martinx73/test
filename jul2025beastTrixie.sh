sudo apt install curl -y
sudo sed -i 's/non-free-firmware/non-free-firmware contrib non-free/g' /etc/apt/sources.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_13/ /' | sudo tee /etc/apt/sources.list.d/home:smplayerdev.list
curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_13/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_smplayerdev.gpg > /dev/null
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo -e 'Types: deb\nURIs: https://download.vscodium.com/debs\nSuites: vscodium\nComponents: main\nArchitectures: amd64 arm64\nSigned-by: /usr/share/keyrings/vscodium-archive-keyring.gpg' \
| sudo tee /etc/apt/sources.list.d/vscodium.sources
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install bleachbit ffmpeg mc default-jdk gparted ntfs-3g ufw freerdp3-x11 smplayer unrar google-chrome-stable sublime-text -y && sudo ufw default deny incoming && sudo ufw default allow outgoing && sudo ufw allow 22 && sudo ufw allow 22022 && sudo ufw allow 11434 && sudo ufw allow 8080 && sudo ufw allow 8006 && sudo ufw enable
curl -fsS https://dl.brave.com/install.sh | sh
sudo mkdir /mnt/catorce/
sudo mkdir /mnt/deskdown/
echo 'UUID=96BE5A3DBE5A1659 /mnt/catorce ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | sudo tee -a /etc/fstab
echo 'UUID=B09CAA479CAA07C4 /mnt/deskdown ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | sudo tee -a /etc/fstab
sudo apt install git build-essential meson itstool libtool pkg-config intltool libicu-dev libpcre2-dev libglib2.0-dev libgtk-3-dev libxml2-utils -y
git clone https://github.com/cboxdoerfer/fsearch.git && cd fsearch/ && meson builddir && ninja -C builddir install
sudo sed -i '8c\XDG_DESKTOP_DIR="/mnt/deskdown/Desktop"' ~/.config/user-dirs.dirs
sudo sed -i '9c\XDG_DOWNLOAD_DIR="/mnt/deskdown/Downloads"' ~/.config/user-dirs.dirs
sudo rm -rf /home/martinx73/Downloads
sudo rm -rf /home/martinx73/Desktop
ln -s /mnt/deskdown/Downloads/ /home/martinx73
ln -s /mnt/deskdown/Desktop/ /home/martinx73
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && source ~/.bashrc && nvm install 24
sudo touch /etc/modprobe.d/blacklist-nouveau.conf
echo 'blacklist nouveau' | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo 'options nouveau modeset=0' | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
sudo update-initramfs -u
sudo rm -rf /etc/apt/sources.list.d/contrib.list
sudo nmcli connection modify 'Wired connection 1' ipv4.address 192.168.100.200/24
sudo nmcli connection modify 'Wired connection 1' ipv4.gateway 192.168.100.1
sudo nmcli connection modify 'Wired connection 1' ipv4.method manual
sudo nmcli connection modify 'Wired connection 1' ipv4.dns '1.1.1.1'
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo reboot
