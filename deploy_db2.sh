SECRET="eyJuYS5jdW11bHVzcmVwby5jb20iOnsidXNlcm5hbWUiOiJ0b2tlbiIsInBhc3N3b3JkIjoiOTkxOTE5NGIwMDU3MDM0N2FmZTA1YmQzNjljN2Y3MmYiLCJlbWFpbCI6ImlkZWxpZGphQGNhLmlibS5jb20iLCJhdXRoIjoiZEc5clpXNDZPVGt4T1RFNU5HSXdNRFUzTURNME4yRm1aVEExWW1Rek5qbGpOMlkzTW1ZPSJ9fQ=="

./switch_namespace.sh db2

helm repo add ibm https://raw.githubusercontent.com/ibm-cloud-architecture/charts/master/stable

helm delete --purge db2
helm install --name db2 \
	--set image.secret=$SECRET,license=accept \
	ibm/ibm-db2oltp-dev 
