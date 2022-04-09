

#Host 1 Srinath
virtual subnet 172.16.0.0
route add default gw 172.16.0.0
route add -net 172.16.1.0 netmask 255.255.255.0 gw 10.0.0.56



#host 2 Akhil
virtual subnet 172.16.1.0
route add default gw 172.16.1.1
route add -net 172.16.0.0 netmask 255.255.255.0 gw 10.0.0.10


Srinath
sudo iptables -A FORWARD -o wlp1s0 -i vboxnet0 -s 172.16.0.0/24 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -o wlp1s0 -j MASQUERADE

Akhil
sudo iptables -A FORWARD -o wlp1s0 -i vboxnet0 -s 172.16.1.0/24 -m conntrack --ctstate NEW -j ACCEPT
sudo iptables -A FORWARD -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT
sudo iptables -t nat -F POSTROUTING
sudo iptables -t nat -A POSTROUTING -o wlp1s0 -j MASQUERADE