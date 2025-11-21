# #https://medium.com/codex/install-nvidia-drivers-cuda-on-debian-12-bookworm-nvidia-smi-69d2980247c6

sudo cp nvidia-drivers /etc/apt/preferences.d/
sudo apt update
sudo apt install nvidia-driver nvidia-smi nvidia-driver
sudo reboot


# wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
# sudo dpkg -i cuda-keyring_1.1-1_all.deb
# sudo apt update
# sudo apt install nvidia-driver -y
# #sudo reboot
# sudo apt install cuda-12-4 -y
# echo 'export PATH=/usr/local/cuda-12.4/bin${PATH:+:${PATH}}' >> ~/.bashrc
# echo 'export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}' >> ~/.bashrc
# echo 'export CUDA_HOME=/usr/local/cuda-12.4' >> ~/.bashrc
# source ~/.bashrc

# #sudo apt install -y nvidia-driver firmware-misc-nonfree
# #sudo apt install -y nvidia-driver nvidia-smi nvidia-settings
# #sudo systemctl set-default graphical.target
# sudo reboot