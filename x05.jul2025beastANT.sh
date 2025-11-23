sudo apt install software-properties-common bleachbit mc default-jdk gparted curl ntfs-3g ufw freerdp2-x11 -y && sudo ufw default deny incoming && sudo ufw default allow outgoing && sudo ufw allow 22 && sudo ufw allow 22022 && sudo ufw allow 11434 && sudo ufw allow 8080 && sudo ufw allow 8006 && sudo ufw allow 5678 && sudo ufw allow 9443 && sudo ufw enable
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:smplayerdev.list
curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_smplayerdev.gpg > /dev/null
sudo dpkg --add-architecture amd64
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install smplayer unrar google-chrome-stable sublime-text -y
curl -fsS https://dl.brave.com/install.sh | sh
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install git linux-headers-$(uname -r) dkms build-essential meson itstool libtool pkg-config intltool libicu-dev libpcre2-dev libglib2.0-dev libgtk-3-dev libxml2-utils -y
git clone https://github.com/cboxdoerfer/fsearch.git && cd fsearch/ && sudo meson builddir && sudo ninja -C builddir install
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && source ~/.bashrc && nvm install 24
sudo apt-get install ffmpeg -y
sudo rm -rf /etc/apt/sources.list.d/contrib.list
sudo nmcli connection modify 'Wired connection 1' ipv4.address 192.168.100.200/24
sudo sudo nmcli connection modify 'Wired connection 1' ipv4.gateway 192.168.100.1
sudo nmcli connection modify 'Wired connection 1' ipv4.method manual
sudo nmcli connection modify 'Wired connection 1' ipv4.dns '1.1.1.1 8.8.8.8'
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo reboot