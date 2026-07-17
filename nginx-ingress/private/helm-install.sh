helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
# changes context to stage
#kubectl config use-context dev

# Create a namespace for your ingress resources
#kubectl create namespace nginx-ingress

# Use Helm to deploy an NGINX ingress controller
helm upgrade --install ingress-nginx ingress-nginx/ingress-nginx \
    --namespace nginx-ingress \
    --set controller.replicaCount=4 \
    -f internal-ingress-web.yaml \
    --set controller.service.externalTrafficPolicy=Local \
    --set allowSnippetAnnotations=true \
    --set controller.nodeSelector."kubernetes\.io/os"=linux \
    --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux
