#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# --- Configuration ---
# Set your network configuration here
WIRED_CONNECTION_NAME="Wired connection 1"
IPV4_ADDRESS="192.168.100.200/24"
IPV4_GATEWAY="192.168.100.1"
IPV4_DNS="1.1.1.1 8.8.8.8"

# --- Helper Functions ---
info() {
    echo "INFO: $1"
}

warning() {
    echo "WARNING: $1"
}

# --- Main Functions ---

setup_firewall() {
    info "Configuring firewall..."
    sudo ufw default deny incoming
    sudo ufw default allow outgoing
    sudo ufw allow 22 # SSH
    sudo ufw allow 22022
    sudo ufw allow 11434
    sudo ufw allow 8080
    sudo ufw allow 8006
    sudo ufw allow 5678
    sudo ufw allow 9443
    sudo ufw enable
}

install_base_packages() {
    info "Installing base packages..."
    sudo apt-get update
    sudo apt-get install -y \
        software-properties-common \
        bleachbit \
        mc \
        default-jdk \
        gparted \
        curl \
        ntfs-3g \
        ufw \
        freerdp2-x11
}

add_third_party_repositories() {
    info "Adding third-party repositories..."
    sudo dpkg --add-architecture amd64

    # Sublime Text
    info "Adding Sublime Text repository..."
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/sublimehq-pub.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/sublimehq-pub.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list > /dev/null

    # Google Chrome
    info "Adding Google Chrome repository..."
    curl -fSsL https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /etc/apt/keyrings/google-chrome.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list > /dev/null

    # SMPlayer
    info "Adding SMPlayer repository..."
    # Using Debian 12 repo, as in original script. Make sure this is correct for your system.
    sudo curl -fsSL https://download.opensuse.org/repositories/home:smplayerdev/Debian_12/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/home_smplayerdev.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/home_smplayerdev.gpg] http://download.opensuse.org/repositories/home:/smplayerdev/Debian_12/ /' | sudo tee /etc/apt/sources.list.d/home:smplayerdev.list > /dev/null

    # Brave Browser
    info "Adding Brave Browser repository..."
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list > /dev/null

    # VSCodium
    info "Adding VSCodium repository..."
    wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | gpg --dearmor | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
    echo 'deb [arch=amd64,arm64 signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg] https://download.vscodium.com/debs vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list > /dev/null

    # Add contrib and non-free
    info "Adding contrib and non-free repositories..."
    sudo add-apt-repository contrib -y
    sudo add-apt-repository non-free -y
}

install_additional_packages() {
    info "Installing additional packages..."
    sudo apt-get update
    sudo apt-get install -y \
        smplayer \
        unrar \
        google-chrome-stable \
        sublime-text \
        brave-browser \
        codium \
        git \
        linux-headers-$(uname -r) \
        dkms \
        build-essential \
        meson \
        itstool \
        libtool \
        pkg-config \
        intltool \
        libicu-dev \
        libpcre2-dev \
        libglib2.0-dev \
        libgtk-3-dev \
        libxml2-utils \
        ffmpeg
    sudo apt-get upgrade -y
    sudo apt-get autoremove -y
}

configure_fstab() {
    info "Configuring /etc/fstab..."
    warning "This script will add entries to /etc/fstab. Make sure the UUIDs are correct for your system to avoid boot issues."
    warning "UUIDs in script: 96BE5A3DBE5A1659 (catorce), B09CAA479CAA07C4 (deskdown)"
    read -p "Do you want to proceed with modifying /etc/fstab? (y/N) " choice
    case "$choice" in
      y|Y )
        mkdir -p /mnt/catorce/
        mkdir -p /mnt/deskdown/
        echo 'UUID=96BE5A3DBE5A1659 /mnt/catorce ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | sudo tee -a /etc/fstab
        echo 'UUID=B09CAA479CAA07C4 /mnt/deskdown ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133,locale=es_ES.UTF-8 0 0' | sudo tee -a /etc/fstab
        info "/etc/fstab modified."
        ;;
      * )
        info "Skipping /etc/fstab modification."
        ;;
    esac
}

build_fsearch() {
    info "Building and installing FSearch..."
    local tmp_dir=$(mktemp -d)
    git clone https://github.com/cboxdoerfer/fsearch.git "$tmp_dir"
    cd "$tmp_dir"
    sudo meson builddir
    sudo ninja -C builddir install
    cd -
    sudo rm -rf "$tmp_dir"
    info "FSearch installation complete."
}

customize_user_env() {
    info "Customizing user environment..."

    # Configure user directories
    if [ -f ~/.config/user-dirs.dirs ]; then
        sed -i 's|XDG_DESKTOP_DIR=.*|XDG_DESKTOP_DIR="/mnt/deskdown/Desktop"|' ~/.config/user-dirs.dirs
        sed -i 's|XDG_DOWNLOAD_DIR=.*|XDG_DOWNLOAD_DIR="/mnt/deskdown/Downloads"|' ~/.config/user-dirs.dirs
    fi

    # Remove old dirs and create symlinks
    sudo rm -rf "$HOME/Downloads"
    sudo rm -rf "$HOME/Desktop"
    ln -s /mnt/deskdown/Downloads/ "$HOME"
    ln -s /mnt/deskdown/Desktop/ "$HOME"

    # Install NVM and Node.js
    info "Installing NVM and Node.js..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    nvm install 24
}

system_configuration() {
    info "Performing system-level configuration..."

    # Disable sleep/hibernate
    sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

    # Blacklist nouveau driver
    info "Blacklisting nouveau driver..."
    echo 'blacklist nouveau' | sudo tee /etc/modprobe.d/blacklist-nouveau.conf
    echo 'options nouveau modeset=0' | sudo tee -a /etc/modprobe.d/blacklist-nouveau.conf
    sudo update-initramfs -u

    # Configure static IP
    warning "This script will configure a static IP address for '$WIRED_CONNECTION_NAME'."
    read -p "Do you want to proceed with network configuration? (y/N) " choice
    case "$choice" in
      y|Y )
        sudo nmcli connection modify "$WIRED_CONNECTION_NAME" ipv4.address "$IPV4_ADDRESS"
        sudo nmcli connection modify "$WIRED_CONNECTION_NAME" ipv4.gateway "$IPV4_GATEWAY"
        sudo nmcli connection modify "$WIRED_CONNECTION_NAME" ipv4.dns "$IPV4_DNS"
        sudo nmcli connection modify "$WIRED_CONNECTION_NAME" ipv4.method manual
        info "Network configuration applied."
        ;;
      * )
        info "Skipping network configuration."
        ;;
    esac

    # Set default to multi-user.target
    info "Setting default systemd target to multi-user.target."
    sudo systemctl set-default multi-user.target
}

main() {
    install_base_packages
    setup_firewall
    add_third_party_repositories
    install_additional_packages
    configure_fstab
    build_fsearch
    customize_user_env
    system_configuration

    info "Script finished!"
    warning "A reboot is required for some changes to take effect."
    read -p "Reboot now? (y/N) " choice
    case "$choice" in
      y|Y )
        info "Rebooting..."
        sudo reboot
        ;;
      * )
        info "Please reboot manually later."
        ;;
    esac
}

main

