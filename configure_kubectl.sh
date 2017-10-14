export MASTER_IP=169.45.207.218
export CLUSTER=mycluster.icp
export CONTEXT=mycluster.icp-context
export USER=mycluster.icp-user
set -x
export AUTH_TOKEN=$(curl -k -u admin:admin https://$MASTER_IP:8443/acs/api/v1/auth/token)

# Trim JSON to string
AUTH_TOKEN=$(echo $AUTH_TOKEN | jq '.token' | tr -d '"')

AUTH_TOKEN=eyJhbGciOiJSUzI1NiJ9.eyJhdF9oYXNoIjoiMmhNOGRta0hBTUwzS09fTDFPd3NnQSIsInJlYWxtTmFtZSI6ImN1c3RvbVJlYWxtIiwidW5pcXVlU2VjdXJpdHlOYW1lIjoiYWRtaW4iLCJpc3MiOiJodHRwczovL215Y2x1c3Rlci5pY3A6OTQ0My9vaWRjL2VuZHBvaW50L09QIiwiYXVkIjoiZDNmNzdiODk4YjljZTc4ZWZmNzI1YjcwMGU0NTE1NjYiLCJleHAiOjE1MDc5NDg2NzQsImlhdCI6MTUwNzk0MTQ3NCwic3ViIjoiYWRtaW4ifQ.K-ptlwWTlyfkXvAdBgcznuSwc3kOrdizxPJIEbbbrM6VGAccMJhH8TiLSQpkTCBG6laBgHIINdWYy6ctPN0Ie6Oyswt4YWVDogm0XFL6qeaWLi5s1CwTOSlBen0cEloQ-KPSa2ct06J8MDZMXao5WFcc6dH-WM6UNCLjJz5TQkoT6TrIhSwWNobhs5i6PF9cFgHnY6DvLPxQZb8iFsKZ1C_3_hO-4TxrbnjYA7Cn6dSZ7hgVJ-pPI3nRiKfwfinCW5ybI45UqRIZYrgMS1A1jvHCQvPjfC2gxJVWTCDZpRJ1JeXqew47DROc-HD2B0aknjxzS1X2r3zY_S8vvOjcYg

kubectl config set-cluster $CLUSTER --server=https://$MASTER_IP:8001 --insecure-skip-tls-verify=true
kubectl config set-context $CONTEXT --cluster=$CLUSTER
kubectl config set-credentials $USER --token=$AUTH_TOKEN
kubectl config set-context $CONTEXT --user=$USER --namespace=default
kubectl config use-context $CONTEXT

echo Remember to switch namespace!

