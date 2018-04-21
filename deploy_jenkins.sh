./create_namespace.sh jenkins

NAME=jenkins

helm delete --purge $NAME --tls

helm install --name $NAME stable/jenkins -f jenkins_config/values.yaml --tls

SLAVE_NAME=slave

helm delete --purge $SLAVE_NAME --tls
helm install --name $SLAVE_NAME ~/github/charts/stable/slave --tls

