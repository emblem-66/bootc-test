#!/bin/bash

set -ouex pipefail

rpm -qa | sort

# Repos

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)

function copr(){
dnf copr enable -y xxmitsu/mesa-git
}

gaming=(
"steam"
"bottles"
"prismlauncher"
"goverlay"
"mangohud"
"gamemode"
"vkBasalt"
)

gnome=(
"gnome-shell"
"nautilus"
"adw-gtk3-theme"
"gnome-shell-extension-caffeine"
"ffmpegthumbnailer"
)

cinnamon=(
"cinnamon"
"nemo"
"adw-gtk3-theme"
"adwaita-icon-theme"
)

remove_packages=(
"firefox"
"firefox-langpacks"
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

# DNF
#dnf install -y dnf5-plugins
#dnf remove -y ${remove_packages[@]}
#dnf install -y ${rpmfusion[@]}
#copr
#dnf copr enable -y ${copr[@]}
#dnf install -y ${gnome[@]}
dnf install -y ${cinnamon[@]}
#dnf install -y ${gaming[@]}
#dnf upgrade -y
dnf autoremove -y

rpm -qa | sort
