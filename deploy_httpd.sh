./create_namespace.sh httpd

echo Removing httpd...
helm delete --purge httpd

echo Deploying httpd...
helm install --name httpd --debug ibm/httpd
