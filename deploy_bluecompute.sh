./create_namespace.sh bluecompute


helm repo add ibmcase https://raw.githubusercontent.com/ibm-cloud-architecture/refarch-cloudnative-kubernetes/master/docs/charts/

echo Enabling Pod security policy...
cd ../refarch-cloudnative-kubernetes/PodSecurityPolicy/
kubectl create -f bluecompute-psp.yaml
kubectl create -f bluecompute-clusterrole.yaml
kubectl create -f bluecompute-clusterrolebinding.yaml

echo Deleting bluecompute...
helm delete --purge bluecompute

echo Installing bluecompute...
helm install --name bluecompute ibmcase/bluecompute-ce