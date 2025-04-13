# Namespaces

#### List the current namespaces in a cluster
```bash
kubectl get namespaces
```

#### Default namespaces
Kubernetes starts with four default namespaces:
- **default**: Used for user workloads when no other namespace is specified.
- **kube-node-lease**: Stores node heartbeat info to help detect node failures.
- **kube-public**: Readable by all users; used for resources meant to be publicly accessible in the cluster.
- **kube-system**: Contains system-level components and objects managed by Kubernetes itself.

#### View a specific namespace
```bash
kubectl get namespaces kube-system
```
#### Get detailed information
```bash
kubectl describe namespaces kube-system
```
#### Create a namespace
- Create a YAML file
```bash
vim my-namespace.yaml
```
```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: kube-space01
```
- Apply it with kubectl
```bash
kubectl create -f ./my-namespace.yaml
kubectl get namespaces
```
#### Create a namespace using a simple command
```bash
kubectl create namespace kube-space02
kubectl get namespaces
```
#### Delete a namespace from yaml
```bash
kubectl delete -f ./my-namespace.yaml
kubectl get namespaces
```
#### Delete namespace by name
```bash
kubectl delete namespaces kube-space02
kubectl get namespaces
```
#### Create namespaces from examples
```bash
kubectl create -f https://k8s.io/examples/admin/namespace-dev.json
kubectl create -f https://k8s.io/examples/admin/namespace-prod.json
kubectl get namespaces
```
#### View pods in a namespace
```bash
kubectl get pods --namespace=development
```
#### Run a pod in a namespace
```bash
kubectl run nginx --image=nginx --namespace=development
kubectl get pods --namespace=development
```
#### Delete a pod in a namespace
```bash
kubectl delete pod nginx -n=development
```
#### Check current context namespace
```bash
kubectl config view --minify | grep namespace:
```
#### Set the current context's namespace
```bash
kubectl config set-context --current --namespace=development
kubectl config view --minify | grep namespace:
```
#### Reset to default namespace
```bash
kubectl config set-context --current --namespace=default
```
#### Show labels on namespaces
```bash
kubectl get namespaces --show-labels
```
#### Create a deployment in the development namespace
```bash
kubectl create deployment snowflake --image=registry.k8s.io/serve_hostname -n=development --replicas=3
```
#### View deployment and pods in developmetn
```bash
kubectl get deployment -n=development
kubectl get pods -l app=snowflake -n=development
```
#### View deployment and pods in production
```bash
kubectl get deployment -n=production
kubectl get pods -n=production
```
#### Create and scale deployment in the production namespace
```bash
kubectl create deployment cattle --image=registry.k8s.io/serve_hostname -n=production
kubectl scale deployment cattle --replicas=5 -n=production
kubectl get deployment -n=production
kubectl get pods -l app=cattle -n=production
```
#### Clean up deployments
```bash
kubectl delete deployment cattle -n=production
kubectl delete deployment snowflake -n=development
```
#### Clean up namespaces
```bash
kubectl delete -f https://k8s.io/examples/admin/namespace-dev.json
kubectl delete -f https://k8s.io/examples/admin/namespace-prod.json
```
