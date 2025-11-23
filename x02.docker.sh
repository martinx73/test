sudo mkdir /mnt/catorce/
sudo mkdir /mnt/deskdown/
echo 'UUID=96BE5A3DBE5A1659 /mnt/catorce ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | sudo tee -a /etc/fstab
echo 'UUID=B09CAA479CAA07C4 /mnt/deskdown ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | sudo tee -a /etc/fstab
sed -i '8c\XDG_DESKTOP_DIR="/mnt/deskdown/Desktop"' ~/.config/user-dirs.dirs
sed -i '9c\XDG_DOWNLOAD_DIR="/mnt/deskdown/Downloads"' ~/.config/user-dirs.dirs
sudo rm -rf /home/martinx73/Downloads
sudo rm -rf /home/martinx73/Desktop
ln -s /mnt/deskdown/Downloads/ /home/martinx73
ln -s /mnt/deskdown/Desktop/ /home/martinx73
#install -m 0755 -d /etc/apt/keyrings &&
#curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc &&
#chmod a+r /etc/apt/keyrings/docker.asc &&
#echo \
#  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
#  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#  tee /etc/apt/sources.list.d/docker.list > /dev/null
#  apt-get update &&
#apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo sed -i 's/non-free-firmware/non-free-firmware contrib non-free/g' /etc/apt/sources.list
sudo apt update
sudo apt install curl -y
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh
sudo docker volume create portainer_data
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:lts
#sudo systemctl set-default graphical.target
sudo reboot