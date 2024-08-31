sudo apt install plasma-desktop sddm -y
sudo apt-add-repository contrib non-free -y
sudo apt install kde-plasma-desktop -y
sudo apt install apt-transport-https curl freerdp2-x11 filezilla p7zip-full p7zip-rar rar unrar ffmpeg libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio vorbis-tools mpv kde-spectacle gwenview ark bleachbit wakeonlan sshfs -y
sudo apt install ufw -y && sudo ufw default deny incoming && sudo ufw default allow outgoing && sudo ufw enable
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install google-chrome-stable -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update && sudo apt install brave-browser -y
sudo apt remove kinfocenter plasma-discover kwalletmanager kdeconnect kmenuedit zutty -y
sudo apt purge kinfocenter plasma-discover kwalletmanager kdeconnect kmenuedit zutty -y
sudo apt autoremove -y
bash <(curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh)
echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:smplayerdev.list
curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_smplayerdev.gpg > /dev/null && sudo apt update && sudo apt install smplayer -y
wget https://github.com/fastfetch-cli/fastfetch/releases/download/2.12.0/fastfetch-linux-amd64.deb
sudo dpkg -i fastfetch-linux-amd64.deb
sudo mkdir /mnt/DATA /mnt/Sharing
mkdir ~/x_remoto_x
#echo "UUID=1695b72c-9157-4df9-9544-fba85448b078  /mnt/DATA  ext4  defaults  0  2" | sudo tee -a /etc/fstab
#echo "UUID=9CEC4A57EC4A2C38                      /mnt/Sharing ntfs  defaults  0  2" | sudo tee -a /etc/fstab
#sudo rm -rf /home/martinx73/Downloads && ln -s /mnt/DATA/Downloads /home/martinx73/Downloads
#sudo rm -rf /home/martinx73/Desktop && ln -s /mnt/DATA/Desktop /home/martinx73/Desktop
sudo apt autoremove
sudo reboot
#sshfs martinx73@192.168.1.200:/mnt ~/x_remoto_x
