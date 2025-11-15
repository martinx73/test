apt install software-properties-common bleachbit mc default-jdk gparted curl ntfs-3g ufw freerdp2-x11 -y && ufw default deny incoming && ufw default allow outgoing && ufw allow 22 && ufw allow 22022 && ufw allow 11434 && ufw allow 8080 && ufw allow 8006 && ufw allow 5678 && ufw allow 9443 && ufw enable
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | tee /etc/apt/keyrings/sublimehq-pub.asc > /dev/null
echo -e 'Types: deb\nURIs: https://download.sublimetext.com/\nSuites: apt/stable/\nSigned-By: /etc/apt/keyrings/sublimehq-pub.asc' | tee /etc/apt/sources.list.d/sublime-text.sources
#sed -i 's/non-free-firmware/non-free-firmware contrib non-free/g' /etc/apt/sources.list
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | gpg --dearmor | tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | tee /etc/apt/sources.list.d/google-chrome.list
#echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_13/ /' | tee /etc/apt/sources.list.d/home:smplayerdev.list
#curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_13/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_smplayerdev.gpg > /dev/null
echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_12/ /' | tee /etc/apt/sources.list.d/home:smplayerdev.list
curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_12/Release.key | gpg --dearmor | tee /etc/apt/trusted.gpg.d/home_smplayerdev.gpg > /dev/null
dpkg --add-architecture amd64
apt update && apt upgrade -y && apt autoremove -y
apt install smplayer unrar google-chrome-stable sublime-text -y
curl -fsS https://dl.brave.com/install.sh | sh
mkdir /mnt/catorce/
mkdir /mnt/deskdown/
add-apt-repository contrib
add-apt-repository non-free
apt update && apt upgrade -y && apt autoremove -y
echo 'UUID=96BE5A3DBE5A1659 /mnt/catorce ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | tee -a /etc/fstab
echo 'UUID=B09CAA479CAA07C4 /mnt/deskdown ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | tee -a /etc/fstab
apt install git linux-headers-$(uname -r) dkms build-essential meson itstool libtool pkg-config intltool libicu-dev libpcre2-dev libglib2.0-dev libgtk-3-dev libxml2-utils -y
git clone https://github.com/cboxdoerfer/fsearch.git && cd fsearch/ && meson builddir && ninja -C builddir install
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' \
    | tee /etc/apt/sources.list.d/vscodium.list
apt update && apt install codium -y
sed -i '8c\XDG_DESKTOP_DIR="/mnt/deskdown/Desktop"' ~/.config/user-dirs.dirs
sed -i '9c\XDG_DOWNLOAD_DIR="/mnt/deskdown/Downloads"' ~/.config/user-dirs.dirs
rm -rf /home/martinx73/Downloads
rm -rf /home/martinx73/Desktop
ln -s /mnt/deskdown/Downloads/ /home/martinx73
ln -s /mnt/deskdown/Desktop/ /home/martinx73
systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash && source ~/.bashrc && nvm install 24
apt-get install ffmpeg -y
#curl -fsSL https://ollama.com/install.sh | sh
touch /etc/modprobe.d/blacklist-nouveau.conf
echo 'blacklist nouveau' | tee -a /etc/modprobe.d/blacklist-nouveau.conf
echo 'options nouveau modeset=0' | tee -a /etc/modprobe.d/blacklist-nouveau.conf
update-initramfs -u
rm -rf /etc/apt/sources.list.d/contrib.list
nmcli connection modify 'Wired connection 1' ipv4.address 192.168.100.200/24
nmcli connection modify 'Wired connection 1' ipv4.gateway 192.168.100.1
nmcli connection modify 'Wired connection 1' ipv4.method manual
nmcli connection modify 'Wired connection 1' ipv4.dns '1.1.1.1 8.8.8.8'
systemctl set-default multi-user.target
reboot
