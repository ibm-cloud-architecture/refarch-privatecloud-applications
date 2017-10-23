export MASTER_IP=169.55.86.202
export CLUSTER=mycluster.icp
export CONTEXT=mycluster.icp-context
export USER=mycluster.icp-user

curl -k -c mycookie -d "{\"uid\":\"admin\",\"password\":\"admin\"}" https://master.cfc:8443/acs/api/v1/auth/login

export AUTH_TOKEN=$(curl -k -u admin:admin https://$MASTER_IP:8443/acs/api/v1/auth/token)

# Trim JSON to string
AUTH_TOKEN=$(echo $AUTH_TOKEN | jq '.token' | tr -d '"')

echo $AUTO_TOKEN

#AUTH_TOKEN=eyJhbGciOiJSUzI1NiJ9.eyJhdF9oYXNoIjoielpaUkZFRWVFNF8tV0Q4aXFkWXNQQSIsInJlYWxtTmFtZSI6ImN1c3RvbVJlYWxtIiwidW5pcXVlU2VjdXJpdHlOYW1lIjoiYWRtaW4iLCJpc3MiOiJodHRwczovL215Y2x1c3Rlci5pY3A6OTQ0My9vaWRjL2VuZHBvaW50L09QIiwiYXVkIjoiZDNmNzdiODk4YjljZTc4ZWZmNzI1YjcwMGU0NTE1NjYiLCJleHAiOjE1MDgyMDM5MDksImlhdCI6MTUwODE5NjcwOSwic3ViIjoiYWRtaW4ifQ.K6Mr_AfSDDY8GRsti8gBEWG1a8Q92JvZqI2sitWZ_I9HAYl0OvmfEE85_yYEl3MBCGHbhurlpb1j6-MLfmfdT_fPp54QmRdBKsTxXmWQb9XwytHxCK7LIr_wi99U3kx5nLjtrLMv3yMx6NnAFvVa5LUvmzAfo9-Q5HNTK3pU35tiMNY6ryiOJB-TbtnGx64WECyIGAep1pqa0ycj1Vcxh7A1lJh770cdxduOtnInQWBO6tEr3Qlz7pClEika7k89He9EiSFxoeNCOPoSbm5qBf5Azdv0XX0h2mqiGRzNwNmCmlabzypAf-OPxuZLfagpzz5FNhoVLL17lnEhmGzEoQ

kubectl config set-cluster $CLUSTER --server=https://$MASTER_IP:8001 --insecure-skip-tls-verify=true
kubectl config set-context $CONTEXT --cluster=$CLUSTER
kubectl config set-credentials $USER --token=$AUTH_TOKEN
kubectl config set-context $CONTEXT --user=$USER --namespace=default
kubectl config use-context $CONTEXT

kubectl config set-cluster mycluster.icp --server=https://169.55.86.202:8001 --insecure-skip-tls-verify=true
kubectl config set-context mycluster.icp-context --cluster=mycluster.icp
kubectl config set-credentials mycluster.icp-user --token=eyJhbGciOiJSUzI1NiJ9.eyJhdF9oYXNoIjoiMzBDa2ZZeTA3ZFNmVm9aQnVLeFlxdyIsInJlYWxtTmFtZSI6ImN1c3RvbVJlYWxtIiwidW5pcXVlU2VjdXJpdHlOYW1lIjoiYWRtaW4iLCJpc3MiOiJodHRwczovL215Y2x1c3Rlci5pY3A6OTQ0My9vaWRjL2VuZHBvaW50L09QIiwiYXVkIjoiYmYyZjM0MDgzNDhlNTZkYmUyNzUyMDUzZWQxNjE3ZDEiLCJleHAiOjE1MDg0MjQyMTEsImlhdCI6MTUwODQxNzAxMSwic3ViIjoiYWRtaW4ifQ.VvGkviMD9DSrmhgcU8gWGuWt33X3I4PskrK5kZtCVB2VE5EvQYCbHa68OQjAv0xQ1Jf6QRr1e5q-wUHQMoROvx86hm5L6bP7kharaudbPZ0iRiGf__Nrkbrfnqn-oyPzvGbGxMlh7_gYqPWHjOpJXIe37xKiHCKhuJc4WdVJZSRGgZ05OG4SZCDgQF3XXQ5o-s-gHXktDVQzdI6FHj22t4NmTWKwsAR-oH0C-5oEZ54sp0i_KVcYzYpj5Hs4dKd4VX5VdxohNiBZ9wIC7fC_7LEsejRPa49jyvQJTKNzWBSI8ltpvPGuhT645hCnz9N8eDpPPNXIEaWS6bvYcltiyA
kubectl config set-context mycluster.icp-context --user=mycluster.icp-user --namespace=default
kubectl config use-context mycluster.icp-context

echo Remember to switch namespace!

