Param(
    [string] $sqlServerPassword = 'Mystrong!password'
)

function Test-HostSqlCmd() {
    Write-Host "Test Host sqlcmd"
    sqlcmd -S localhost,32000 -U sa -P $sqlServerPassword -Q "SELECT @@VERSION"
}

function Test-PodSqlCmd() {
    Write-Host "Test Pod sqlcmd"
    $sqlServerPodName = $(kubectl get pods --selector=app=sqlserver-pod -o=custom-columns=NAME:.metadata.name)[1]
    kubectl exec $sqlServerPodName -- /opt/mssql-tools/bin/sqlcmd -S localhost,1433 -U sa -P $sqlServerPassword -Q "SELECT @@VERSION"
}

Test-HostSqlCmd
Test-PodSqlCmd