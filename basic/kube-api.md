# kube-api

kubectl get nodes
kubectl get pods -n kube-system | grep apiserver

cat /etc/kubernetes/manifests/kube-apiserver.yaml
cat /etc/systemd/system/kube-apiserver.service
ps -aux | grep kube-apiserver


