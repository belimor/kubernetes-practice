# Namespaces

#### List the current namespaces in a cluster
```bash
kubectl get namespace
```

#### Default namespaces
Kubernetes starts with four default namespaces:
default: Used for user workloads when no other namespace is specified.
kube-node-lease: Stores node heartbeat info to help detect node failures.
kube-public: Readable by all users; used for resources meant to be publicly accessible in the cluster.
kube-system: Contains system-level components and objects managed by Kubernetes itself.

#### View a specific namespace
```bash
kubectl get namespaces <name>
```
#### Get detailed information
```bash
kubectl describe namespaces <name>
```
#### Create a namespace
1. Create a YAML file
```bash
vim my-namespace.yaml
```
```
apiVersion: v1
kind: Namespace
metadata:
  name: <insert-namespace-name-here>
```
2. Apply it with kubectl
```vash
kubectl create -f ./my-namespace.yaml
```

# Alternatively, you can create namespace using:
kubectl create namespace <insert-namespace-name-here>

# Deleting a namespace:
kubectl delete -f ./my-namespace.yaml
kubectl delete namespaces <insert-some-namespace-name>

kubectl get namespaces

kubectl create -f https://k8s.io/examples/admin/namespace-dev.json
kubectl create -f https://k8s.io/examples/admin/namespace-prod.json

kubectl get pods --namespace=development
kubectl run nginx --image=nginx --namespace=development
kubectl get pods --namespace=development
kubectl delete pod nginx -n=development

kubectl config view --minify | grep namespace:
kubectl config set-context --current --namespace=development
kubectl config view --minify | grep namespace:
kubectl config set-context --current --namespace=default

kubectl get namespaces --show-labels

kubectl create deployment snowflake --image=registry.k8s.io/serve_hostname -n=development --replicas=2

kubectl get deployment -n=development

kubectl get pods -l app=snowflake -n=development

kubectl get deployment -n=production

kubectl get pods -n=production

kubectl create deployment cattle --image=registry.k8s.io/serve_hostname -n=production

kubectl scale deployment cattle --replicas=5 -n=production

kubectl get deployment -n=production

kubectl get pods -l app=cattle -n=production

kubectl delete deployment cattle -n=production

kubectl delete deployment snowflake -n=development

kubectl delete -f https://k8s.io/examples/admin/namespace-dev.json

kubectl delete -f https://k8s.io/examples/admin/namespace-prod.json




