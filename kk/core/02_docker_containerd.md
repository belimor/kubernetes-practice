# Docker vs Contrainrd
## CRI - Container Runtime Interface
## OCI - Open Container Initiative
- imagespec
- runtimespec

**dockershim** - used for Docker engine without CRI

**containerd** - part of the docker but separate project

docker support depricated starting from 1.24

## **ctr** - cli for containerd
```bash
ctr images pull docker.io/library/redis:alpine
ctr run docker.io/library/redis:alpine redis
```
## **nerdctl** - alternative for ctr (similar to docker)
```bash
nerdctl run --name redise redis:alpine
nerdctl run --name webserver -p 80:80 -d nginx
```
## **crictl** - provides cli for CRI
```bash
crictl
crictl pull busybox
crictl images
crictl ps -a
crictl exec -i -t <container_id> ls
crictl logs <container_id>
crictl pods
crictl --runtime-endpoint
export CONTAINER_RUNTIME_ENDPOINT
```
