# Cluster Upgrade 

### On the Control Plane

#### Update apt package lists
```bash
apt update
```
#### Review the Kubernetes apt source list
```bash
cat /etc/apt/sources.list.d/kubernetes.list
```
#### Edit the Kubernetes repository entry
```bash
vim /etc/apt/sources.list.d/kubernetes.list
```
```
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
```
#### Update apt again after modifying the repo
```bash
apt-get update
```
#### Check available kubeadm versions
```bash
apt-cache madison kubeadm
```
#### Unhold kubeadm to allow version change
```bash
apt-mark unhold kubeadm
```
#### Install specific kubeadm version, for example 1.31.7-1.1
```bash
apt-get install -y kubeadm=1.31.7-1.1
```
#### Hold kubeadm at the new version
```bash
apt-mark hold kubeadm
```
#### Verify kubeadm version
```bash
kubeadm version
```
### On the Kubernetes Cluster
kubectl drain cp --ignore-daemonsets

### On the Control Plane
kubeadm upgrade plan
kubeadm upgrade apply v1.31.7

apt-mark unhold kubelet kubectl
apt-get install -y kubelet=1.31.7-1.1 kubectl=1.31.7-1.1
apt-mark hold kubelet kubectl
apt update
apt upgrade
"""
The following packages will be upgraded:
  cri-tools kubernetes-cni
"""
systemctl daemon-reload
systemctl restart kubelet

# On the Kubernetes Cluster:
kubectl get node
kubectl uncordon cp
kubectl get node

# # #

###############
# On the Worker Node: 
cat /etc/apt/sources.list.d/kubernetes.list
vim /etc/apt/sources.list.d/kubernetes.list
"""
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /
"""
apt-get update
apt-cache madison kubeadm
apt-mark showhold
apt-mark unhold kubeadm
apt-get install -y kubeadm=1.31.7-1.1
apt-get install -y kubeadm
apt-mark hold kubeadm

# On the Kubernetes Cluster:
kubectl get pods -A -o wide | grep worker1
kubectl get pods -o wide
kubectl get nodes
kubectl drain worker1 --ignore-daemonsets

# On the Worker Node:
apt-mark unhold kubelet kubectl
apt-cache madison kubelet kubectl
apt-get install -y kubelet=1.31.7-1.1 kubectl=1.31.7-1.1
apt-get install -y kubelet kubectl
apt-mark hold kubelet kubectl
systemctl daemon-reload
systemctl restart kubelet
apt update
apt upgrade
apt-get install cri-tools kubernetes-cni

# On the Kubernetes Cluster
kubectl get nodes
kubectl uncordon worker1
kubectl get nodes
kubectl get pods -A -o wide | grep worker1
get pods -o wide





