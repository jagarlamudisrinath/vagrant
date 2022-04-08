

#Host 1
virtual subnet 192.168.57.0
route add default gw 192.168.57.1
route add -net 192.168.56.0 netmask 255.255.255.0 gw 10.0.0.10


#host 2
virtual subnet 192.168.56.0
route add default gw 192.168.56.1
route add -net 192.168.57.0 netmask 255.255.255.0 gw 10.0.0.56


sudo iptables -A FORWARD -o wlp1s0 -i vboxnet0 -s 192.168.56.0/24 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -o wlp1s0 -j MASQUERADE