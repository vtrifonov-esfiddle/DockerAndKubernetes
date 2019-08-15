.\sqlserver-deployment-down.ps1 -deleteVolume $true
.\sqlserver-deployment-up.ps1
Start-Sleep -Seconds 40
.\sqlserver-deployment-test.ps1