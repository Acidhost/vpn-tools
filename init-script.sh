#!/bin/bash

# Create directories
mkdir /var/log/openvpn/

# TUN interface
mkdir -p /dev/net
mknod /dev/net/tun c 10 200

# Iptables
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.103.0/24 -j MASQUERADE

# Start OpenVPN service
openvpn --daemon --config /vpn-tools/openvpn/server.conf
sleep 3

# Start Dante socks proxy
sockd -f /vpn-tools/sockd/sockd.conf