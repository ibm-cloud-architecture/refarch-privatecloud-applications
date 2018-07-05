. ./helm.sh

./create_namespace.sh dsx

# helm repo add ibm https://raw.githubusercontent.com/ibm-cloud-architecture/charts/master/stable

helm delete --purge dsx $HELM_OPTIONS 
helm install --name dsx ibm-charts/ibm-dsx-dev $HELM_OPTIONS