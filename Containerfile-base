#FROM scratch AS ctx

#COPY --chmod=755 build.sh /

FROM quay.io/fedora/fedora-bootc:latest

#COPY --chmod=755 /rootfs /

#RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#    --mount=type=cache,dst=/var/cache \
#    --mount=type=cache,dst=/var/log \
#    --mount=type=tmpfs,dst=/tmp \
#    /ctx/build.sh

RUN cat /etc/os-release

RUN bootc container lint
