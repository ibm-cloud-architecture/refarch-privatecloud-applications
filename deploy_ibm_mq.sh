. ./helm.sh

echo Creating namespace...
./create_namespace.sh mq

echo Destroying IBM MQ...
helm delete --purge mq $HELM_OPTIONS

echo Deploying IBM MQ...
helm install -n mq --set license=accept ibm-charts/ibm-mqadvanced-server-dev $HELM_OPTIONS
