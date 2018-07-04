. ./helm.sh

./create_namespace.sh bluecompute

helm repo add ibmcase \
https://raw.githubusercontent.com/ibm-cloud-architecture/refarch-cloudnative-kubernetes/master/docs/charts/bluecompute-ce

echo Deleting bluecompute...
helm delete --purge bluecompute $HELM_OPTIONS

echo Installing bluecompute...
helm install --name bluecompute ibmcase/bluecompute-ce $HELM_OPTIONS