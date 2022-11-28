#!/bin/bash

# Create directories
mkdir /var/log/openvpn/

# TUN interface
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

# Iptables
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.103.0/24 -j MASQUERADE

# Start Dante socks proxy
sockd -D -f /vpn-tools/sockd/sockd.conf

# Start OpenVPN service
openvpn --config /vpn-tools/openvpn/server.conf