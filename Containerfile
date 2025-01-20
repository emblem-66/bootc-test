#FROM quay.io/fedora/fedora-silverblue:rawhide
#FROM ghcr.io/ublue-os/base-main:latest
FROM quay.io/fedora-ostree-desktops/base-atomic:rawhide
RUN rpm -qa | sort > /tmp/packages-base.txt
RUN dnf copr enable -y solopasha/hyprland \
&&  dnf install -y hyprland && dnf history info
RUN dnf install -y \
xdg-desktop-portal-hyprland \
hyprland-contrib \
hyprland-plugins \
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
mpvpaper && dnf history info


#RUN dnf install -y gdm gnome-shell ptyxis nautilus xdg-user-dirs xdg-user-dirs-gtk bash-completion && systemctl enable gdm && systemctl set-default graphical.target

#RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash && ostree container commit
