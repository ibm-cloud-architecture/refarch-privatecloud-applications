export MASTER_IP=169.45.207.218
export CLUSTER=mycluster.icp
export CONTEXT=mycluster.icp-context
export USER=mycluster.icp-user
export AUTH_TOKEN=$(curl -k -u admin:admin https://$MASTER_IP:8443/acs/api/v1/auth/token)

# Trim JSON to string
AUTH_TOKEN=$(echo $AUTH_TOKEN | jq '.token' | tr -d '"')

AUTH_TOKEN=eyJhbGciOiJSUzI1NiJ9.eyJhdF9oYXNoIjoiUU1uQTZKRjdBZkRvMVNsM3IyX2Y1QSIsInJlYWxtTmFtZSI6ImN1c3RvbVJlYWxtIiwidW5pcXVlU2VjdXJpdHlOYW1lIjoiYWRtaW4iLCJpc3MiOiJodHRwczovL215Y2x1c3Rlci5pY3A6OTQ0My9vaWRjL2VuZHBvaW50L09QIiwiYXVkIjoiZDNmNzdiODk4YjljZTc4ZWZmNzI1YjcwMGU0NTE1NjYiLCJleHAiOjE1MDc5ODc2ODgsImlhdCI6MTUwNzk4MDQ4OCwic3ViIjoiYWRtaW4ifQ.geaFzpomxtkk6Fkn8PQUrSUgBocbMEQghowKPI6smVuG58DoMAqXqard_yrG3HYOIvOU6Ci-AnZgJNUDp2BuN_RQwr90TvREl_mJyD0CnPA7QCzsQCj1JsKMVrGHlOBcSM6bYBFEbpYFcZyH4JbKu8s9S3LviRBtf-33mU6JKDM3wXJesRD2ItRLjedfaIofuI8T3MR8MwAcnyC-IfAw94t9eJH_GlUsxai2UXAenCyBaqf8ZPpmNiEydq6MLtY5CL2msAbrY7zY4vaah9FpfEt-woR7VqfTQjkeGdMcfRSlYvxtLqXh6jBPAPbkP0o1GrlCDg8EbFPP9hrYzsqLrA

kubectl config set-cluster $CLUSTER --server=https://$MASTER_IP:8001 --insecure-skip-tls-verify=true
kubectl config set-context $CONTEXT --cluster=$CLUSTER
kubectl config set-credentials $USER --token=$AUTH_TOKEN
kubectl config set-context $CONTEXT --user=$USER --namespace=default
kubectl config use-context $CONTEXT

echo Remember to switch namespace!

