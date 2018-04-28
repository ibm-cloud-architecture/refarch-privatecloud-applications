TILLER_NAMESPACE=default
./create_namespace.sh jenkins

NAME=jenkins
HELM_OPTIONS="--tiller-namespace=$TILLER_NAMESPACE"

helm delete --purge $NAME $HELM_OPTIONS

helm install --name $NAME stable/jenkins -f jenkins_config/values.yaml $HELM_OPTIONS

SLAVE_NAME=slave

helm delete --purge $SLAVE_NAME $HELM_OPTIONS
helm install --name $SLAVE_NAME ~/github/charts/stable/slave $HELM_OPTIONS
