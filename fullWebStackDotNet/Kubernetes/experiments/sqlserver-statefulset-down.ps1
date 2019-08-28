kubectl delete -f ..\sqlserver-statefulset.yaml
kubectl delete pvc sqlserver-statefulset-claim-sqlserver-statefulset-0
kubectl delete pv sqlserver-statefulset-volume