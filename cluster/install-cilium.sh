#!/bin/bash

kubectl create namespace cilium
kubectl -n cilium apply -f cilium-node-init.yaml
sleep 30

kubectl apply -f cilium-with-node-init.yaml
sleep 30

kubectl delete pods -n kube-system $(kubectl get pods -n kube-system -o custom-columns=NAME:.metadata.name,HOSTNETWORK:.spec.hostNetwork --no-headers=true | grep '<none>' | awk '{ print $1 }')
