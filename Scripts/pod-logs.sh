#/bin/bash
read -p "Enter Pod Name: " pod
kubectl get po --all-namespaces | grep $pod | awk '{print $2 " -n " $1}' | xargs kubectl logs -f;