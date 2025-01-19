#FROM quay.io/fedora/fedora-silverblue:rawhide
#FROM ghcr.io/ublue-os/base-main:latest
FROM quay.io/fedora-ostree-desktops/base-atomic:rawhide

RUN dnf copr enable -y solopasha/hyprland \
&&  dnf install -y hyprland \
&&  dnf install -y \
xdg-desktop-portal-hyprland \
hyprland-git \
hyprland-legacyrenderer \
hyprland-contrib \
hyprland-plugins \
hyprland-plugins-git \
hyprpaper \
hyprpicker \
hypridle \
hyprlock \
hyprsunset \
hyprpolkitagent \
hyprsysteminfo \
hyprland-autoname-workspaces \
hyprshot \
aylurs-gtk-shell \
waybar-git \
eww-git \
cliphist \
nwg-clipman \
swww \
waypaper \
hyprnome \
hyprdim \
swaylock-effects \
pyprland \
mpvpaper

RUN rpm -qa | sort

#RUN dnf install -y gdm gnome-shell ptyxis nautilus xdg-user-dirs xdg-user-dirs-gtk bash-completion && systemctl enable gdm && systemctl set-default graphical.target

#RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash && ostree container commit
