#!/bin/bash

set -ouex pipefail

rpm -qa | sort

# Repos

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)

copr=(
"xxmitsu/mesa-git"
)

# Packages

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

install_packages=(
"adw-gtk3-theme"
"gnome-shell-extension-caffeine"
"ffmpegthumbnailer"
)

# DNF

dnf install -y dnf5-plugins
dnf remove -y ${remove_packages[@]}
dnf install -y ${rpmfusion[@]}
dnf copr enable -y ${copr[@]}
dnf install -y ${install_packages[@]}
dnf autoremove -y
dnf upgrade -y

# Checkout

rpm -qa | sort
