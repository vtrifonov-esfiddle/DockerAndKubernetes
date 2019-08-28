function Test-SqlServerJob() {
    Write-Host "sqlserver-test kubernetes job"
    kubectl -f ..\sqlserver-test.yaml apply
    sleep 10
    $sqlServerTestPodName = $(kubectl get pods --selector=job-name=sqlserver-test -o=custom-columns=NAME:.metadata.name)[1]
    kubectl logs $sqlServerTestPodName
}

Test-SqlServerJob