export KUBE_GCE_API_ENDPOINT=https://www.googleapis.com/compute/v1/
export KUBE_GCE_ZONE=us-central1-d
export REGION=us-central1

export GCI_VERSION="cos-dev-72-11264-0-0"
export KUBE_GCI_VERSION="cos-dev-72-11264-0-0"

export KUBE_GCE_MASTER_PROJECT="cos-cloud"
export KUBE_GCE_NODE_PROJECT="cos-cloud"
#export KUBE_GCE_ENABLE_IP_ALIASES=true
export KUBE_GCE_ENABLE_IP_ALIASES=false
export KUBE_UP_AUTOMATIC_CLEANUP=true
export KUBE_CLUSTER_INITIALIZATION_TIMEOUT=3600
export MASTER_DISK_SIZE=250GB
export NODE_DISK_SIZE=250GB
NETD_YAML=/usr/local/google/home/varunmar/go/src/github.com/GoogleCloudPlatform/netd/netd.yaml
export KUBE_CUSTOM_NETD_YAML=$(cat $NETD_YAML | sed -e 's/^/ /')
#export KUBE_CUSTOM_NETD_YAML=$(curl -s https://raw.githubusercontent.com/GoogleCloudPlatform/netd/master/netd.yaml | sed -e 's/^/ /')
export KUBE_ENABLE_NETD=true
export NUM_NODES=1
export SUBNETWORK=default
export NODE_SCOPES=monitoring,logging-write,storage-ro,https://www.googleapis.com/auth/xapi.zoo
