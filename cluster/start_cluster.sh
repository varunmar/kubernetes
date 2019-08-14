export KUBE_ROOT=/usr/local/google/home/varunmar/go/src/k8s.io/kubernetes

export NUM_NODES=5
export KUBE_GCE_ENABLE_IP_ALIASES=true
export MAX_PODS_PER_NODE=1000
export KUBE_GCE_ZONE=us-central1-b
export NODE_SIZE=n1-standard-32
export MASTER_SIZE=n1-standard-16
export MASTER_DISK_SIZE=200
export NETWORK_PROVIDER=cni

./kube-up.sh
