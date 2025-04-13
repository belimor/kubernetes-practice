# Working with Kubernetes Nodes and Taints

#### List all nodes in the cluster
```bash
kubectl get node
```
Displays a summary of all nodes in your cluster, including their status, roles, age, and version.
####  Describe a control plane node
```bash
kubectl describe node cp
```
Shows detailed information about the node named cp (assumed to be the control plane), including capacity, conditions, addresses, and taints.
#### Check taints on all nodes
```bash
kubectl describe node | grep -i taint
```
Filters the output of kubectl describe node to show only the lines related to taints (case-insensitive). Helpful for quickly identifying any taints across all nodes.
#### Remove control-plane taint from all nodes
```bash
kubectl taint nodes --all node-role.kubernetes.io/control-plane-
```
Removes the default taint from control-plane nodes, allowing them to schedule regular workloads (pods). By default, control-plane nodes are tainted to only allow critical system pods.
#### Verify taint removal
```bash
kubectl describe node | grep -i taint
```
Re-checks all nodes to ensure that the taints have been successfully removed.
