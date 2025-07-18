sudo apt install curl ufw freerdp2-x11 -y && sudo ufw default deny incoming && sudo ufw default allow outgoing && sudo ufw enable
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | sudo tee /etc/apt/sources.list.d/sublime-text.sources
sudo apt install software-properties-common -y && sudo apt-add-repository contrib non-free -y
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
sudo apt install unrar google-chrome-stable sublime-text -y
curl -fsS https://dl.brave.com/install.sh | sh
sudo mkdir /mnt/data/
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
echo 'UUID=5E3C93C53C93971D	/mnt/data	ntfs-3g	uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8  0  0' | sudo tee -a /etc/fstab
sudo apt install git build-essential meson itstool libtool pkg-config intltool libicu-dev libpcre2-dev libglib2.0-dev libgtk-3-dev libxml2-utils -y
git clone https://github.com/cboxdoerfer/fsearch.git && cd fsearch/ && meson builddir && ninja -C builddir install
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium -y
sudo sed -i '8c\XDG_DESKTOP_DIR="/mnt/data/x/Desktop"' ~/.config/user-dirs.dirs
sudo sed -i '9c\XDG_DOWNLOAD_DIR="/mnt/data/x/Downloads"' ~/.config/user-dirs.dirs
sudo rm -rf /home/martinx73/Downloads
ln -s /mnt/data/x/Downloads/ /home/martinx73
sudo reboot