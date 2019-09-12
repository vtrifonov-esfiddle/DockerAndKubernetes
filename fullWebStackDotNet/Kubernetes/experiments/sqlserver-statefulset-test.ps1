function Test-SqlServerJob() {
    Write-Host "sqlserver-test kubernetes job"
    kubectl -f .\sqlserver-test.yaml apply
    sleep 10
    $sqlServerTestPodName = $(kubectl get pods --selector=job-name=sqlserver-test -o=custom-columns=NAME:.metadata.name)[1]
    kubectl logs $sqlServerTestPodName
}

function Test-SqlServer() {
    Write-Host "redeploy sqlserver-statefulset"
    kubectl -f ..\fullStack\sqlserver-statefulset.yaml apply
    kubectl delete pod sqlserver-statefulset-0
}

Test-SqlServer
#Test-SqlServerJob