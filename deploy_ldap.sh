function deploy_ldap {
	echo Deploying LDAP chart
	helm delete --purge ldap --tls
	helm install --name ldap stable/openldap --set adminPassword=admin --set service.type=NodePort --tls
}

./create_namespace.sh ldap

kubectl create -f ./ldap_config/default-psp.yaml

deploy_ldap

PASSWORD=admin
USER="cn=admin,dc=example,dc=org"

echo Testing connection
POD_ID=$(kubectl get po | grep ldap | grep -v admin | awk '{print $1}')
echo Pod: $POD_ID

kubectl exec $POD_ID -- ldapsearch -x -h localhost -b dc=example,dc=org -D "$USER" -w $PASSWORD

echo Copying file
kubectl cp ldap_config/default.ldif $POD_ID:/container/service/slapd/assets/test/

echo Importing LDIF
kubectl exec $POD_ID --  ldapadd -x -h localhost -D "$USER" -w $PASSWORD -f /container/service/slapd/assets/test/default.ldif

echo Testing user
kubectl exec $POD_ID -- ldapsearch -x -LLL -D "$USER" -w $PASSWORD -b "uid=student1,dc=example,dc=org" -s sub "(objectClass=person)" uid

echo ==========================
echo
echo LDAP admin available at port 31080
echo user: $USER, pwd: $PASSWORD
