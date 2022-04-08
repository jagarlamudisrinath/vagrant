#!/bin/bash
echo "[TASK 10] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
192.168.57.4   kmaster.example.com     kmaster
192.168.56.4   kworker0.example.com    kworker1
192.168.56.5   kworker1.example.com    kworker2
EOF