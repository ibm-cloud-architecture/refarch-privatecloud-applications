for i in {1..50}
do
   echo Creating PV $i
   sed s/FILE_SYSTEM/d-${i}/g < config/volume.yaml > /tmp/volume-${i}.yaml
   kubectl create -f /tmp/volume-${i}.yaml
   rm /tmp/volume-${i}.yaml
done

