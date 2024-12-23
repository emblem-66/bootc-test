FROM quay.io/fedora/fedora-silverblue:latest
RUN curl -s "https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh" | bash && ostree container commit
