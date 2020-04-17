#!/bin/sh

IP_FORWARD_ENABLE=`sysctl -n net.ipv4.ip_forward`
if [ "$IP_FORWARD_ENABLE" -eq "0" ]; then
    echo "[Error] IP forward disabled. On host, execute below commands:"
    echo "        echo \"net.ipv4.ip_forward = 1\" | sudo tee -a /etc/sysctl.conf"
    echo "        sysctl -p"
else
    echo "[Info] IP forward enabled."
fi

# Enable NAT forwarding
iptables -t nat -A POSTROUTING -s $OCSERV_SUBNET -o eth0 -j MASQUERADE || echo "[Error] No permission to operate iptables."
iptables -A FORWARD -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu || echo "        Run container with option \"--cap-add=NET_ADMIN\"."

# Enable TUN device
if [ ! -e /dev/net/tun ]; then
    mkdir -p /dev/net
    mknod /dev/net/tun c 10 200
    chmod 600 /dev/net/tun
fi

# Run OpennConnect Server
ocserv -c /etc/ocserv/ocserv.conf -f -d 1 "$@"
