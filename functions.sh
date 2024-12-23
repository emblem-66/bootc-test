# Functions for Fedora

# Terra repos
function f_terra(){
  curl -o /etc/yum.repos.d/terra.repo "https://raw.githubusercontent.com/terrapkg/subatomic-repos/main/terra.repo"
  dnf install -y terra-release
}

# RPM-fusion
function f_rpmfusion(){
  rpmfusion=(
    "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
    "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
  )
  dnf install -y ${rpmfusion[@]}
}

# Fedora auto updates
function f_updates(){
  sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
  sudo sed -i 's/#LockLayering=false/LockLayering=true/' /etc/rpm-ostreed.conf
  systemctl enable rpm-ostreed-automatic.timer
  cat <<EOF | sudo tee /etc/systemd/system/flatpak-update.service > /dev/null
[Unit]
Description=Update Flatpaks
[Service]
Type=oneshot
ExecStart=/usr/bin/flatpak update -y
[Install]
WantedBy=default.target
EOF
  systemctl enable flatpak-update.service
  
  cat <<EOF | sudo tee /etc/systemd/system/flatpak-update.timer > /dev/null
[Unit]
Description=Update Flatpaks
[Timer]
OnCalendar=*:0/4
Persistent=true
[Install]
WantedBy=timers.target
EOF
  systemctl enable flatpak-update.timer
}

# Flatpak auto updates
function f_flatpak(){
  echo "function"
}

# Multimedia
function f_multimedia(){
  echo "function"
}

# Gaming
function f_gaming(){
  echo "function"
}

# GNOME
function f_gnome(){
  echo "function"
}
