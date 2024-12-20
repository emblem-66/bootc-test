#!/bin/bash

set -ouex pipefail

# DNF
function function_dnf(){
    # RPMFusion
    dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    rpmfusion=(
        "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
        "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
    )
    #dnf install -y ${rpmfusion[@]}
    # Terra repos
    sudo dnf install -y--repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc' terra-release
    sudo dnf install -y anda
    # COPR
    dnf copr enable -y xxmitsu/mesa-git
    dnf copr enable -y gui1ty/bottles
    # System auto updates & Layer lock
    sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
    sudo sed -i 's/#LockLayering=false/LockLayering=true/' /etc/rpm-ostreed.conf
    systemctl enable rpm-ostreed-automatic.timer
}

# GNOME
function function_gnome(){
    #commands
    gnome=(
    "gnome-shell"
    "nautilus"
    "adw-gtk3-theme"
    "gnome-shell-extension-caffeine"
    "ffmpegthumbnailer"
    )
    
    remove_packages=(
    "fedora-chromium-config-gnome"
    "fedora-chromium-config"
    "gnome-classic-session"
    "gnome-shell-extension-window-list"
    "gnome-shell-extension-background-logo"
    "gnome-shell-extension-launch-new-instance"
    "gnome-shell-extension-apps-menu"
    "gnome-shell-extension-places-menu"
    "gnome-tour"
    "gnome-software"
    "yelp"
    "yelp-libs"
    "yelp-xsl"
    )
}

# KDE
function function_kde(){
    #commands
}

# Gaming
function function_gaming(){
    dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    dnf copr enable -y gui1ty/bottles
    dnf install -y steam bottles prismlauncher goverlay mangohud gamemode vkBasalt
}

function function_cleanup(){
    dnf remove -y firefox firefox-langpacks
    dnf autoremove -y
}

# Functions
function_dnf
#function_gnome
#function_gaming
function_cleanup

rpm -qa | sort | grep mesa
