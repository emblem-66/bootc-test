FROM quay.io/fedora/fedora-silverblue:latest
COPY build_files /tmp
RUN chmod +x /build_files/* && ./build_files/script.sh && ostree container commit
