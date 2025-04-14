# Backup the etcd database 

#### Find the data directory of the etcd daemon on the control plane:
```bash
grep data-dir /etc/kubernetes/manifests/etcd.yaml
```
#### Log into the etcd container and look at the options etcdctl provides
```bash
kubectl -n kube-system exec -it etcd-cp -- sh
```
- On Container
```bash
etcdctl -h
cd /etc/kubernetes/pki/etcd
echo *
exit
```
#### Check etcd database health, loopback IP and port 2379
```bash
kubectl -n kube-system exec -it etcd-cp -- sh -c "ETCDCTL_API=3 ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key etcdctl endpoint health"
```
#### Determine how many databases are part of the cluster.
#### Three and five are common in a production environment.
```bash
kubectl -n kube-system exec -it etcd-cp -- sh -c "ETCDCTL_API=3 ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key etcdctl --endpoints=https://127.0.0.1:2379 member list"
```
#### Status of the cluster in a table format
```bash
kubectl -n kube-system exec -it etcd-cp -- sh -c "ETCDCTL_API=3 ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key etcdctl --endpoints=https://127.0.0.1:2379 member list -w table"
```
#### Save the snapshot into the container data directory /var/lib/etcd/
```bash
kubectl -n kube-system exec -it etcd-cp -- sh -c "ETCDCTL_API=3 ETCDCTL_CACERT=/etc/kubernetes/pki/etcd/ca.crt ETCDCTL_CERT=/etc/kubernetes/pki/etcd/server.crt ETCDCTL_KEY=/etc/kubernetes/pki/etcd/server.key etcdctl --endpoints=https://127.0.0.1:2379 snapshot save /var/lib/etcd/snapshot.db"
```
#### Verify the snapshot exists from the control plane node perspective
```bash
ls -l /var/lib/etcd/
```
#### Backup the snapshot as well as other information used to create the cluster
```bash
mkdir $HOME/kubernetes/backup
cp /var/lib/etcd/snapshot.db $HOME/backup/snapshot.db-$(date +%m-%d-%y)
cp /root/kubeadm-config.yaml $HOME/backup/
cp -r /etc/kubernetes/pki/etcd $HOME/backup/
```
#### attempt a database restore after the final lab exercise of the course. More on the restore process can be found here:
https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/#restoring-an-etcd-cluster



