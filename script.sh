#!/bin/bash

set -ouex pipefail

rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
)
rpm -q rpmfusion-free-release rpmfusion-nonfree-release || dnf install -y ${rpmfusion[@]}

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

dnf remove -y ${remove_packages[@]}
dnf install -y ${install_packages[@]}
dnf autoremove -y
dnf copr enable -y xxmitsu/mesa-git


dnf install -y ${rpmfusion[@]}

rpm -qa | sort | grep mesa

git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com
git clone https://github.com/joaophi/tailscale-gnome-qs.git /tmp && mv /tmp/tailscale@joaophi.github.com /usr/share/gnome-shell/extensions/
