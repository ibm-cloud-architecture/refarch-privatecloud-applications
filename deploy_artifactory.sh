#./create_namespace.sh artifactory
./switch_namespace.sh artifactory

echo Removing Artifactory
helm delete --purge artifactory

echo Deploying Artifactory
helm install --name artifactory --set nginx.service.type=NodePort,nginx.externalPortHttp=8080 \
 stable/artifactory