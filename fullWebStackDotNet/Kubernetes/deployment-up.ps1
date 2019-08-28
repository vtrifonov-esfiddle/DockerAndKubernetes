function New-MongoDbCredentialsSecret() {
    $mongodbSecretsDir = ".\secrets\mongodb"
    $rootUsername = "$mongodbSecretsDir\root-username.txt"
    $rootPassword = "$mongodbSecretsDir\root-password.txt"
    kubectl create secret generic mongodb --from-file=$rootUsername --from-file=$rootPassword
}
function New-MongodbWebApiSecrets() {
    $secretsRootDir = ".\secrets\mongodb-webapi"
    $connectionString = "$secretsRootDir\connection-string.txt"
    $webclientHost = "$secretsRootDir\webclient-host.txt"
    kubectl create secret generic mongodb-webapi --from-file=$connectionString --from-file=$webclientHost
}
function New-SaSecret() {
    kubectl create secret generic sqlserver --from-file=.\secrets\sa-password.txt
}
function New-SqlServerWebApiSecrets() {
    $secretsRootDir = ".\secrets\sqlserver-webapi"
    $connectionString = "$secretsRootDir\connection-string.txt"
    $webclientHost = "$secretsRootDir\webclient-host.txt"
    kubectl create secret generic sqlserver-webapi --from-file=$connectionString --from-file=$webclientHost
}

New-SaSecret
kubectl -f .\sqlserver-statefulset.yaml apply

New-SqlServerWebApiSecrets
kubectl -f .\sqlserver-webapi-deployment.yaml apply

New-MongoDbCredentialsSecret
kubectl -f .\mongodb-statefulset.yaml apply

New-MongodbWebApiSecrets
kubectl -f .\mongodb-webapi-deployment.yaml apply

kubectl -f .\nginx-deployment.yaml apply
kubectl -f .\react-aspnet-deployment.yaml apply