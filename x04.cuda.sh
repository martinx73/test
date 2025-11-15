sudo apt install -y nvidia-cuda-toolkit nvidia-cuda-dev
# Agrega esto a tu ~/.bashrc:
echo 'export PATH=/usr/local/cuda/bin:$PATH' >> /home/martinx73/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> /home/martinx73/.bashrc
echo 'export CUDA_HOME=/usr/local/cuda' >> /home/martinx73/.bashrc
# LUEGO
source ~/.bashrc
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update
sudo apt-get install -y nvidia-container-toolkit
sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker
sudo docker run --rm --gpus all nvidia/cuda:12.3.2-base-ubuntu22.04 nvidia-smi