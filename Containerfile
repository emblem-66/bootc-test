FROM quay.io/fedora/fedora-silverblue:rawhide
#RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash #&& ostree container commit
RUN rpm -qa | sort | grep kernel
RUN rpm -qa | sort | grep mesa
RUN rpm -qa | sort | grep gnome-shell

FROM quay.io/fedora/fedora-silverblue:42
RUN rpm -qa | sort | grep kernel
RUN rpm -qa | sort | grep mesa
RUN rpm -qa | sort | grep gnome-shell

FROM quay.io/fedora/fedora-silverblue:41
RUN rpm -qa | sort | grep kernel
RUN rpm -qa | sort | grep mesa
RUN rpm -qa | sort | grep gnome-shell
