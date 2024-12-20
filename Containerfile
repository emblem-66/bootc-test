FROM quay.io/fedora/fedora-silverblue:latest
#RUN curl -s https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh | bash && ostree container commit
RUN bash << EOF
    # RPMFusion
    dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    # Terra repos
    dnf install -y --repofrompath 'terra,https://repos.fyralabs.com/terra$releasever' --setopt='terra.gpgkey=https://repos.fyralabs.com/terra$releasever/key.asc' terra-release
    dnf install -y anda
    # COPR
    dnf copr enable -y xxmitsu/mesa-git
    dnf copr enable -y gui1ty/bottles
    # System auto updates
    sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
    sudo sed -i 's/#LockLayering=false/LockLayering=true/' /etc/rpm-ostreed.conf
    systemctl enable rpm-ostreed-automatic.timer
    dnf remove -y firefox firefox-langpacks
    dnf autoremove -y
    rpm -qa | sort
EOF
