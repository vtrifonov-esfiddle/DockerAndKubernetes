function New-SaSecret() {
    kubectl create secret generic sqlserver --from-file=.\secrets\sa-password.txt
}

New-SaSecret
kubectl -f .\sqlserver-deployment.yaml apply