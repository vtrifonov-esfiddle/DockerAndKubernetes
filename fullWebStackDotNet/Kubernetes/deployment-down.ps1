function Remove-Nginx() {
    kubectl delete deployment nginx-deployment
    kubectl delete service nginx
    kubectl delete service nginx-react-aspnetcore
    kubectl delete service nginx-mongodb
    kubectl delete service nginx-sqlserver
}

function Remove-ReactAspnet() {
    kubectl delete deployment react-aspnet-deployment
    kubectl delete service react-aspnetcore-production
}

function Remove-Mongodb() {    
    kubectl delete secret mongodb
    kubectl delete pvc mongodb-statefulset-claim-mongodb-statefulset-0    
    kubectl delete statefulset mongodb-statefulset
    kubectl delete service mongo
    kubectl delete pod mongodb-statefulset-0
    kubectl delete pv mongodb-data-volume
    kubectl delete pvc mongodb-backups-claim
    kubectl delete pv mongodb-backups-volume
}

function Remove-MongodbWebApi() {
    kubectl delete deployment mongodb-webapi-deployment
    kubectl delete service mongodb-webapi-production
    kubectl delete secret mongodb-webapi
}

function Remove-SqlserverWebApi() {
    kubectl delete deployment sqlserver-webapi-deployment
    kubectl delete service sql-server-webapi-production
    kubectl delete secret sqlserver-webapi
}

function Remove-Sqlserver() {
    kubectl delete secret sqlserver        
    kubectl delete pvc sqlserver-statefulset-claim-sqlserver-statefulset-0
    kubectl delete statefulset sqlserver-statefulset
    kubectl delete service sqlserver
    kubectl delete pod sqlserver-statefulset-0
    kubectl delete pv sqlserver-data-volume
}

Remove-Nginx
Remove-ReactAspnet
Remove-Mongodb
Remove-MongodbWebApi
Remove-SqlserverWebApi
Remove-Sqlserver
