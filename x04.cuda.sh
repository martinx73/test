wget https://developer.download.nvidia.com/compute/cuda/repos/debian12/x86_64/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
sudo apt-get update
sudo apt-get install cuda-toolkit-12-4 -y
#sudo apt-get install cuda-drivers -y
#sudo apt-get install nvidia-cuda-dev -y
# Agrega esto a tu ~/.bashrc:
#echo 'export PATH=/usr/local/cuda/bin:$PATH' >> /home/martinx73/.bashrc
#echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> /home/martinx73/.bashrc
#echo 'export CUDA_HOME=/usr/local/cuda' >> /home/martinx73/.bashrc
# LUEGO
#source ~/.bashrc
#curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
#    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
#curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
#    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
#    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
#sudo apt-get update
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
  && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
sudo docker run --rm --gpus all nvidia/cuda:12.3.2-base-ubuntu22.04 nvidia-smi
curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/debian12/sbsa/3bf863cc.pub | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-cuda.gpg
echo 'deb [signed-by=/usr/share/keyrings/nvidia-cuda.gpg] https://developer.download.nvidia.com/compute/cuda/repos/debian11/x86_64/ /' | sudo tee /etc/apt/sources.list.d/nvidia-cuda.list
sudo apt update
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> ~/.bashrc
source ~/.bashrc
nvcc --version
sudo apt update && sudo apt full-ugrade -y && sudo apt autoremove -y
sudo reboot
