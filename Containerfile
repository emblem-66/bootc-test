FROM quay.io/fedora/fedora-bootc:latest
RUN curl -s https://raw.githubusercontent.com/Emblem-66/bootc-test/refs/heads/main/script.sh | bash
