function New-SaSecret() {
    kubectl create secret generic sqlserver --from-file=.\secrets\sa-password.txt
}

.\sql-server-build.ps1
New-SaSecret
kubectl -f .\sqlserver-deployment.yaml apply