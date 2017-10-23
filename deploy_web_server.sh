./create_namespace.sh webserver

NAME=webserver

helm delete --purge $NAME
helm install --name $NAME --set TOMCAT_ALLOW_REMOTE_MANAGEMENT=0 ibm/tomcat

