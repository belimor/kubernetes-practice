# etcd
- distributed reliable key-value store that is Simple, Secure, Fast
Key-value:
```bash
{
  "Name": "John",
  "Age": 35,
  "location": Toronto,
  "salary": 120000
}
```

```bash
apt install etcd
```
## etcd
- Default port 2379
```bash
etcdctl set key1 value1
etcdctl get key1
etcdctl
etcdctl version
export ETCDCTL_API=3
etcdctl put key1 value1
```
### Kubernetes ETCD contains information about:
- Nodes
- PODs
- Configs
- Secrets
- Accounts
- Roles
- Bindings
- Others

### etcd keys
```bash
kubectl get pods -n kube-system | grep etcd
kubectl exec etcd-master -n kube-system etcdctl get / --prefix -keys-only
```

- For example, ETCDCTL version 2 supports the following commands:
```bash
etcdctl backup
etcdctl cluster-health
etcdctl mk
etcdctl mkdir
etcdctl set
```
- Whereas the commands are different in version 3
```bash
etcdctl snapshot save
etcdctl endpoint health
etcdctl get
etcdctl put
```
To set the right version of API set the environment variable ETCDCTL_API command
```bash
export ETCDCTL_API=3
```
When the API version is not set, it is assumed to be set to version 2. And version 3 commands listed above don’t work. When API version is set to version 3, version 2 commands listed above don’t work.

Apart from that, you must also specify the path to certificate files so that ETCDCTL can authenticate to the ETCD API Server. The certificate files are available in the etcd-master at the following path. We discuss more about certificates in the security section of this course. So don’t worry if this looks complex:

```bash
--cacert /etc/kubernetes/pki/etcd/ca.crt
--cert /etc/kubernetes/pki/etcd/server.crt
--key /etc/kubernetes/pki/etcd/server.key
```
So for the commands, I showed in the previous video to work you must specify the ETCDCTL API version and path to certificate files. Below is the final form:
```bash
kubectl exec etcd-controlplane -n kube-system -- sh -c "ETCDCTL_API=3 etcdctl get / \
  --prefix --keys-only --limit=10 / \
  --cacert /etc/kubernetes/pki/etcd/ca.crt \
  --cert /etc/kubernetes/pki/etcd/server.crt \
  --key /etc/kubernetes/pki/etcd/server.key"
```

