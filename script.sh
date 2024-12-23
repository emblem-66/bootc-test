#!/bin/bash

set -ouex pipefail

source <(curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/functions.sh")

rpm -qa | grep mesa

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
# Gaming
f_gaming
# GNOME
f_gnome

rpm -qa | grep kernel

echo "done"
