ARG VERSION

FROM filebrowser/filebrowser:${VERSION} AS Get

FROM alpine:3.22

ENV PS1="\[\e[32m\][\[\e[m\]\[\e[36m\]\u \[\e[m\]\[\e[37m\]@ \[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[37;35m\]in\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[32m\][\[\e[m\]\[\e[37m\]\d\[\e[m\] \[\e[m\]\[\e[37m\]\t\[\e[m\]\[\e[32m\]]\[\e[m\] \n\[\e[1;31m\]$ \[\e[0m\]" \
  PUID=1000 \
  PGID=1000 \
  UMASK=022 \
  TZ=Asia/Shanghai

RUN apk add --no-cache \
  ca-certificates \
  mailcap \
  curl \
  s6-overlay \
  bash \
  jq \
  tzdata

COPY --from=Get --chmod=755 /bin/filebrowser /usr/bin/filebrowser
COPY --chmod=755 rootfs/ /

VOLUME /config
EXPOSE 80

ENTRYPOINT [ "/init" ]

HEALTHCHECK --start-period=2s --interval=5s --timeout=3s CMD /healthcheck.sh