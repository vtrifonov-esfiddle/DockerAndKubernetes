$sqlServerPodName = $(kubectl get pods --selector=app=sqlserver-pod -o=custom-columns=NAME:.metadata.name)[1]
kubectl exec -it $sqlServerPodName /bin/bash