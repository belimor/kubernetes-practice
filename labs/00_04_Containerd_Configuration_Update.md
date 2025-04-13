# Updating `crictl` Configuration for Containerd Compatibility

Containerd may still be using an out of date notation for the runtime-endpoint. You may see errors about an undeclared resource type such as unix//:. We will update the crictl configuration. There are many possible configuration options. We will set one, and view the configuration file that is created. We will also set this configuration on worker node as well for our convenience.

#### Update `crictl` configuration on both control plane and worker nodes
```bash
crictl config --set runtime-endpoint=unix:///run/containerd/containerd.sock --set image-endpoint=unix:///run/containerd/containerd.sock
```
#### Verify the new configuration file
```bash
cat /etc/crictl.yaml
```
#### Print default kubeadm configuration
```bash
kubeadm config print init-defaults
```
