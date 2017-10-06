./create_namespace.sh cam

function create_log_pv {
	echo Creating log PV
	kubectl delete pv d-10	
	kubectl delete pv cam-logs-nfs
	kubectl create -f cam_install/cam/pre-install/cam-logs-pv.yaml 
}

function create_db_pv {
	echo Creating DB PV
	kubectl delete pv d-11
	kubectl create -f cam_install/cam/pre-install/cam-mongo-pv.yaml 
}

function create_log_pvc {
	echo Creating log PVC
	kubectl delete pvc cam-log
	kubectl create -f cam_config/cam_log_pvc.yaml	
}

function deploy_create_log_dirs {
	echo Creating log directories
	cd cam_config
	./deploy_create_log_dirs.sh
}

#create_log_pv
#create_db_pv
#create_log_pvc
deploy_create_log_dirs

