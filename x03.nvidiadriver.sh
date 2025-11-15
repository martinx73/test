#wget https://download.nvidia.com/XFree86/Linux-x86_64/550.54.14/NVIDIA-Linux-x86_64-550.54.14.run
#chmod +x NVIDIA-Linux-x86_64-550.54.14.run
#./NVIDIA-Linux-x86_64-550.54.14.run
# wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
# dpkg -i cuda-keyring_1.1-1_all.deb
# apt-get update
# apt-get -y install install cuda-toolkit-13-0
# echo 'export PATH=${PATH}:/usr/local/cuda/bin' | tee -a ~/.bashrc
# apt-get install -y cuda-drivers
# curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
#     | gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
# curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
#     | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
#     | tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
# apt-get update
# apt-get install -y nvidia-container-toolkit
# nvidia-ctk runtime configure --runtime=docker
# systemctl set-default graphical.target
# reboot

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

# #https://medium.com/codex/install-nvidia-drivers-cuda-on-debian-12-bookworm-nvidia-smi-69d2980247c6

# curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
#     | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
# curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
#     | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
#     | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
# sudo apt-get update
# sudo apt-get install -y nvidia-container-toolkit
# sudo nvidia-ctk runtime configure --runtime=docker
# sudo systemctl restart docker

# sudo docker run --rm --gpus all nvidia/cuda:12.3.2-base-ubuntu22.04 nvidia-smi

# -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
# #https://medium.com/codex/install-nvidia-drivers-cuda-on-debian-12-bookworm-nvidia-smi-69d2980247c6
sudo apt install -y nvidia-driver firmware-misc-nonfree
sudo apt install -y nvidia-driver nvidia-smi nvidia-settings
sudo systemctl set-default graphical.target
sudo reboot
