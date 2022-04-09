#!/bin/bash
echo "[TASK 10] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.16.0.100   kmaster.example.com     kmaster
172.16.1.101  kworker0.example.com    kworker1
172.16.1.102   kworker1.example.com    kworker2
EOF