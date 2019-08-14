#!/bin/bash

kubectl create -f endpoints.yaml
for load in 1000 5000 10000 20000 30000; do
  echo -n "Load=$load at "
  date --utc +%T
  kubectl create -f load-$load-service.yaml
  #sleep 3
  for npods in {1000..7000..1000}; do
    echo -n "Creating service $npods at "
    date --utc +%T
    kubectl create -f service-$npods-pods.yaml;
    kubectl -n cilium exec cilium-6vl5j /usr/bin/cilium metrics list | grep seconds > "load-$load-service-$npods.metric"
    #sleep 1;
    kubectl delete svc/service-$npods-pods;
    #sleep 20;
  done
  kubectl delete svc/load-$load-pods
  #sleep 10;
done
