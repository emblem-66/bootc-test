FROM quay.io/fedora/fedora-silverblue:latest
COPY build_files/ /tmp/
RUN chmod +x /tmp/build_files/* && ./tmp/build_files/script.sh && ostree container commit
