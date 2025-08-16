#SSH para SERVIDOR
sudo apt install libpam-google-authenticator -y
sudo tee /etc/pam.d/sshd < /dev/null
echo 'auth required pam_google_authenticator.so' | sudo tee -a /etc/pam.d/sshd
sudo sed -i '62c\KbdInteractiveAuthentication yes' /etc/ssh/sshd_config
echo 'ChallengeResponseAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
echo 'PasswordAuthentication no' | sudo tee -a /etc/ssh/sshd_config
echo 'PubkeyAuthentication yes' | sudo tee -a /etc/ssh/sshd_config
echo 'AuthenticationMethods publickey,keyboard-interactive' | sudo tee -a /etc/ssh/sshd_config
google-authenticator
sudo reboot