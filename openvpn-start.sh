#!/bin/bash

docker run -d -p 5190:1194/udp --cap-add=NET_ADMIN --mount type=bind,source=/etc/openvpn,target=/etc/openvpn ovpn