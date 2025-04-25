#FROM quay.io/fedora/fedora-sericea:latest
#FROM ghcr.io/wayblueorg/hyprland:latest
#FROM quay.io/fedora/fedora-silverblue:rawhide
#FROM ghcr.io/ublue-os/base-main:latest
#FROM quay.io/fedora-ostree-desktops/base-atomic:rawhide
#RUN rpm -qa | sort
#RUN dnf copr enable -y solopasha/hyprland && dnf install -y hyprland

#RUN dnf install -y gdm gnome-shell ptyxis nautilus xdg-user-dirs xdg-user-dirs-gtk bash-completion && systemctl enable gdm && systemctl set-default graphical.target

#RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash && ostree container commit

FROM quay.io/fedora/fedora-silverblue:latest
RUN rpm -qa | sort

FROM quay.io/fedora/fedora:latest
RUN rpm -qa | sort

FROM quay.io/fedora/fedora-bootc:latest
RUN rpm -qa | sort

FROM quay.io/fedora/fedora-minimal:latest
RUN rpm -qa | sort

#RUN curl -s https://raw.githubusercontent.com/Emblem-66/ServerBlue/refs/heads/main/Instructions.sh | bash && rm -rf /tmp/* /var/* && ostree container commit
