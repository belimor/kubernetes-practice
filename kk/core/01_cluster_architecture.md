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
