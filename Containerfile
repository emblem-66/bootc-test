#FROM quay.io/fedora/fedora-silverblue:rawhide
FROM quay.io/fedora-ostree-desktops/base-atomic:rawhide
RUN rpm -qa | sort

FROM ghcr.io/ublue-os/base-main:latest
RUN rpm -qa | sort

#RUN dnf install -y gdm gnome-shell ptyxis nautilus xdg-user-dirs xdg-user-dirs-gtk bash-completion && systemctl enable gdm && systemctl set-default graphical.target

#RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash && ostree container commit
