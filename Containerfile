FROM quay.io/fedora/fedora-silverblue:rawhide
#RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash 
RUN dnf remove -y firefox && ostree container commit
