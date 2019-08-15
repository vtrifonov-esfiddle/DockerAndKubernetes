Param(
    [bool] $deleteVolume = $false
)

kubectl delete deployment sqlserver-deployment
kubectl delete service sqlserver-service
kubectl delete pvc sqlserver-data-claim
kubectl delete secret sqlserver
if ($deleteVolume) {
    kubectl delete pv sqlserver-data-volume
}