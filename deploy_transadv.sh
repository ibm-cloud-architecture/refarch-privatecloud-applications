./create_namespace.sh transadv

helm delete --purge transadv
helm install -n transadv ibm/ibm-transadv-dev
