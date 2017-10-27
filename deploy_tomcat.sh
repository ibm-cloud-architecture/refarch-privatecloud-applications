./create_namespace.sh tomcat

echo Removing tomcat...
helm delete --purge tomcat

echo Deploying tomcat...
helm install --name tomcat ibm/tomcat
