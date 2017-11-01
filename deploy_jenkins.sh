./create_namespace.sh jenkins

#NAME=jenkins

#helm delete --purge $NAME

#helm install --name $NAME stable/jenkins -f jenkins_config/values.yaml

SLAVE_NAME=slave

helm delete --purge $SLAVE_NAME
helm install --name $SLAVE_NAME ~/github/charts/stable/slave

