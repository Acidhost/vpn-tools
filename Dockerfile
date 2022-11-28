FROM alpine:latest
RUN apk add --update openvpn dante-server iptables bash && \
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
EXPOSE 1194/udp
WORKDIR /vpn-tools
ADD ./init-script.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/init-script.sh
CMD ["init-script.sh"]