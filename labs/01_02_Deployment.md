# Kubernetes Deployment

#### Setup default namespace
```bash
kubectl create namesapce kube-space01
kubectl config view --minify | grep namespace:
kubectl config set-context --current --namespace=kube-space01
kubectl config view --minify | grep namespace:
```
#### Apply k8s.io example deployment
```bash
kubectl apply -f https://k8s.io/examples/controllers/nginx-deployment.yaml
```
#### Check deployment and status
```bash
kubectl get deployments
kubectl rollout status deployment/nginx-deployment
kubectl get rs
kubectl get pods --show-labels
```
### Updating a Deployment
#### Update the container image version
```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1
```
#### Edit the deployment manually (optional)
```bash
kubectl edit deployment/nginx-deployment
```
#### Monitor the rollout
```bash
kubectl rollout status deployment/nginx-deployment
```
#### Confirm changes
```bash
kubectl get deployments
kubectl get rs
kubectl get pods
kubectl describe deployments
```
### Rolling Back a Deployment
#### Introduce a faulty image version (to simulate rollback)
```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.161
```
#### Watch rollout and review failures
```bash
kubectl rollout status deployment/nginx-deployment
kubectl get rs
kubectl get pods
kubectl describe deployment
```
#### Check rollout history
```bash
kubectl rollout history deployment/nginx-deployment
kubectl rollout history deployment/nginx-deployment --revision=2
```
#### Roll back to the previous revision
```bash
kubectl rollout undo deployment/nginx-deployment
kubectl rollout undo deployment/nginx-deployment --to-revision=2
```
#### Confirm rollback
```bash
kubectl get deployment nginx-deployment
kubectl describe deployment nginx-deployment
```
### Scaling a Deployment
#### Scale manually
```bash
kubectl scale deployment/nginx-deployment --replicas=10
```
#### Set up autoscaling
```bash
kubectl autoscale deployment/nginx-deployment --min=10 --max=15 --cpu-percent=80
```
#### Monitor deployment
```bash
kubectl get deploy
kubectl get rs
```
#### Test pause, image update, and resume
kubectl set image deployment/nginx-deployment nginx=nginx:sometag
kubectl get rs
kubectl get deploy
kubectl get rs
kubectl get deploy
kubectl rollout pause deployment/nginx-deployment
kubectl set image deployment/nginx-deployment nginx=nginx:1.16.1
kubectl rollout history deployment/nginx-deployment
kubectl get rs
kubectl set resources deployment/nginx-deployment -c=nginx --limits=cpu=200m,memory=512Mi
kubectl rollout resume deployment/nginx-deployment
kubectl get rs --watch
kubectl get rs

kubectl rollout status deployment/nginx-deployment

kubectl delete deployment nginx-deployment
kubectl config set-context --current --namespace=default
kubectl delete namesapce kuber-space-01
kubectl config view --minify | grep namespace:
kubectl get namesapces
