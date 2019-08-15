function New-SqlServerWebApiSecrets() {
    $secretsRootDir = ".\secrets\sqlserver-webapi"
    $connectionString = "$secretsRootDir\connection-string.txt"
    $webclientHost = "$secretsRootDir\webclient-host.txt"
    kubectl create secret generic sqlserver-webapi --from-file=$connectionString --from-file=$webclientHost
}
New-SqlServerWebApiSecrets
kubectl -f .\sqlserver-webapi-deployment.yaml apply