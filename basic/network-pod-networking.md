# pod networking

- every POD should have an IP Address
- every POD should be able to communicate with every other POD in the same node
- every POD should be able to communicate with every other POD on the other nodes without NAT

## flannel
## cilium
## nsx

## manual setup
node1 - 192.168.1.11
node2 - 192.168.1.12
node3 - 192.168.1.13

## create bridge network on each node
ip link add v-net-0 type bridge
ip link set dev v-net-0 up

## subnets for each node
10.244.1.0/24
ip addr add 10.244.1.1/24 dev v-net-0
10.244.2.0/24
ip addr add 10.244.2.1/24 dev v-net-0
10.244.3.0/24
ip addr add 10.244.3.1/24 dev v-net-0

## net-script.sh for each container
ADD)
- Create veth pair
ip link add ...
- Attach veth pair
ip link set ...
ip link set ...
- Assign IP address
ip -n <namespace> addr add ...
ip -n <namespace> route add ...
- Bring up the interface
ip -n <namesapce> list set ...
DEL)
...

## add routes to the nodes
- node1:
ip route add 10.244.2.2 via 192.168.1.12
ip route add 10.244.3.2 via 192.168.1.13
- node 2:
ip route add 10.244.1.2 via 192.168.1.11
ip route add 10.244.3.2 via 192.168.1.13
- node3
ip route add 10.244.1.2 via 192.168.1.11
ip route add 10.244.2.2 via 192.168.1.12


/etc/cni/net.d/net-script.conflist
/opt/cni/bin/net-script.sh
./net-script.sh add <container> <namespace>


