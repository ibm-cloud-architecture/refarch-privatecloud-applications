./create_namespace.sh dsx

helm repo add ibm https://raw.githubusercontent.com/ibm-cloud-architecture/charts/master/stable

helm delete --purge dsx
helm install --name dsx ibm/ibm-dsx-dev