sudo apt install plasma-desktop sddm
sudo apt-add-repository contrib non-free
sudo apt install apt-transport-https curl freerdp2-wayland filezilla p7zip-full p7zip-rar rar unrar ffmpeg libavcodec-extra gstreamer1.0-libav gstreamer1.0-plugins-ugly gstreamer1.0-plugins-bad gstreamer1.0-pulseaudio vorbis-tools mpv kde-spectacle
curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor | sudo tee /usr/share/keyrings/google-chrome.gpg >> /dev/null && echo deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list && sudo apt update && sudo apt install google-chrome-stable -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update && sudo apt install brave-browser -y
sudo apt remove kinfocenter plasma-discover kwalletmanager kdeconnect kmenuedit zutty
sudo apt purge kinfocenter plasma-discover kwalletmanager kdeconnect kmenuedit zutty
sudo apt autoremove
echo 'deb http://download.opensuse.org/repositories/home:/smplayerdev/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:smplayerdev.list
curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_12/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_smplayerdev.gpg > /dev/null && sudo apt update && sudo apt install smplayer
