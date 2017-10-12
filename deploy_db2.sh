SECRET="eyJuYS5jdW11bHVzcmVwby5jb20iOnsidXNlcm5hbWUiOiJ0b2tlbiIsInBhc3N3b3JkIjoiNmU1YzRiYmI0NTc3NmY5NWQxOTNhMWZjODYwZTY4MDUiLCJlbWFpbCI6ImlkZWxpZGphQGNhLmlibS5jb20iLCJhdXRoIjoiZEc5clpXNDZObVUxWXpSaVltSTBOVGMzTm1ZNU5XUXhPVE5oTVdaak9EWXdaVFk0TURVPSJ9fQ=="

./switch_namespace.sh db2

helm repo add ibm https://raw.githubusercontent.com/ibm-cloud-architecture/charts/master/stable

helm delete --purge db2
helm install --name db2 \
	--set image.secret=$SECRET,license=accept \
	ibm/ibm-db2oltp-dev 
