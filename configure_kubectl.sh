export MASTER_IP=169.55.86.200
export CLUSTER_NAME=cfc
export AUTH_TOKEN=$(curl -k -u admin:admin https://$MASTER_IP:8443/acs/api/v1/auth/token)

# Trim JSON to string
AUTH_TOKEN=$(echo $AUTH_TOKEN | jq '.token' | tr -d '"')


kubectl config set-cluster $CLUSTER_NAME --server=https://$MASTER_IP:8001 --insecure-skip-tls-verify=true
kubectl config set-context $CLUSTER_NAME --cluster=$CLUSTER_NAME
kubectl config set-credentials user --token=$AUTH_TOKEN
kubectl config set-context $CLUSTER_NAME --user=user --namespace=default
kubectl config use-context $CLUSTER_NAME


echo Remember to switch namespace!