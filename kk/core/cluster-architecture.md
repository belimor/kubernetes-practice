# Cluster Architecture
## control plane
- etcd
- kube-api
- kube-scheduler
- controller-manager
    - node-controller
    - replication-controller
## worker node
- kubelet
- kube-proxy
- container-engine
---
# Container Runtime Interface - CRI
## OCI - Open Container Initiative
- imagespec
- runtimespec

dockershim - used for Docker engine without CRI

containerd - part of the docker but separate

## cli for containerd
```bash
ctr images pull docker.io/library/redis:alpine
ctr run docker.io/library/redis:alpine redis
```
## nerdctl - alternative for ctr (similar to docker)
```bash
nerdctl run --name redise redis:alpine
nerdctl run --name webserver -p 80:80 -d nginx
```
# crictl - provides cli for CRI
```bash
crictl
crictl pull busybox
crictl images
crictl ps -a
crictl exec -i -t <container_id> ls
crictl logs <container_id>
crictl pods
```
