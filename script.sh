#!/bin/bash

set -ouex pipefail

source <(curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/functions.sh")

# Tweask and changes

# Terra repos
f_terra
# RPM-fusion
f_rpmfusion
# Fedora auto updates
f_updates
# Flatpak auto updates
f_flatpak
# Multimedia
f_multimedia
# Fonts
f_fonts
# CachyOS Kernel
f_cachy
# Mesa-git
f_mesa-git
# Gaming
f_gaming
# GNOME
f_gnome
# Tailscale
f_tailscale
# Distrobox
f_distrobox
# Sublime Text
#f_sublime
# Cleanup
f_cleanup

echo "done"
