#!/usr/bin/env python3

import socket


hostname = socket.gethostname()
ipaddr = socket.gethostbyname(hostname)

print(hostname)
print(ipaddr)
