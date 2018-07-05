. ./helm.sh

./create_namespace.sh httpd

echo Removing httpd...
helm delete --purge httpd $HELM_OPTIONS

echo Deploying httpd...
helm install --name httpd --debug ibm/httpd $HELM_OPTIONS
 