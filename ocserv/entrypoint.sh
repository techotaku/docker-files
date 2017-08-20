#!/bin/sh

# Check ipv4 ip forward
sysctl -p
sysctl net.ipv4.ip_forward

# Enable NAT forwarding
iptables -t nat -A POSTROUTING -j MASQUERADE
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu

# Enable TUN device
if [ ! -e /dev/net/tun ]; then
    mkdir -p /dev/net
    mknod /dev/net/tun c 10 200
    chmod 600 /dev/net/tun
fi

# Run OpennConnect Server
ocserv -c /etc/ocserv/ocserv.conf -f -d 1 "$@"