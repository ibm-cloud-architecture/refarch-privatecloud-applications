#. ./helm.sh

./create_namespace.sh httpd

#echo Creating service account...
#kubectl create serviceaccount tiller --namespace kube-system

#echo Defining role...
#kubectl delete role tiller-manager
#kubectl create -f httpd_config/role-tiller.yaml

#echo Binding service account to role...
#kubectl delete rolebinding tiller-binding
#kubectl create -f httpd_config/rolebinding-tiller.yaml

echo Removing httpd...
helm delete --purge httpd $HELM_OPTIONS

echo Deploying httpd...
helm install --name httpd --debug ibm/httpd $HELM_OPTIONS
 