./create_namespace.sh ldap

helm repo add cnct http://atlas.cnct.io
helm install cnct/openldap

echo LDAP admin available at http://169.45.207.215:31080/
echo user: admin, pwd: admin
