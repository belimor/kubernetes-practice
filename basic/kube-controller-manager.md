# kube-controller-manager

- watch status
- remediate situation

cat /etc/systemd/system/kube-controller-manager.service

kubectl get pods -n kube-system | grep kube-controller-manager

cat /etc/kubernetes/manifests/kube-controller-manager.yaml

ps -aux | grep kube-controller-manager

## node-controller:
node monitor period - 5s.
node monitor grace period - 40s.
pod eviction timeout - 5m.

## replication-controller:

## deployment-controller

## namespace-controller

## endpoint-controller

## service-account-controller

## job-controller

## PV-protection-controller

## PV-binder-controller

## stateful-set

etc...
