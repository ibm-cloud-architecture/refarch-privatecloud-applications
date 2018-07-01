. ./helm.sh

./create_namespace.sh artifactory
#./switch_namespace.sh artifactory

echo Removing Artifactory
helm delete --purge artifactory $HELM_OPTIONS

echo Deploying Artifactory
helm install --name artifactory --set \
nginx.service.type=NodePort,nginx.externalPortHttp=8080,\
artifactory.persistence.enabled=false,postgres.persistence.enabled=false \
stable/artifactory-ha $HELM_OPTIONS
