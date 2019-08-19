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
    kubectl delete deployment mongodb-deployment
    kubectl delete service mongo
    kubectl delete pvc mongodb-data-claim
    kubectl delete secret mongodb
    kubectl delete pv mongodb-data-volume
}

function Remove-MongodbWebApi() {
    kubectl delete deployment mongodb-webapi-deployment
    kubectl delete service mongodb-webapi
    kubectl delete service mongodb-webapi-production
    kubectl delete secret mongodb-webapi
}

function Remove-SqlserverWebApi() {
    kubectl delete deployment sqlserver-webapi-deployment
    kubectl delete service sqlserver-webapi-service
    kubectl delete service sql-server-webapi-production
    kubectl delete secret sqlserver-webapi
}

function Remove-Sqlserver() {
    kubectl delete deployment sqlserver-deployment
    kubectl delete service sqlserver-service
    kubectl delete pvc sqlserver-data-claim
    kubectl delete secret sqlserver
    kubectl delete pv sqlserver-data-volume
}

Remove-Nginx
Remove-ReactAspnet
Remove-Mongodb
Remove-MongodbWebApi
Remove-SqlserverWebApi
Remove-Sqlserver
