# E2E k8s deploy experiment

## Bootstrapping the cluster

0. Install istio:

```
brew install istioctl
istioctl install --set profile=demo -y
```

1. Spin up kind cluster

```
kind create cluster --config kind/cluster.yaml
```

2. Create the namespaces

```
kubectl create -f namespaces/argo.yaml -f namespaces/edge.yaml -f namespaces/production.yaml
```

3. Create the ingress

```
kubectl apply -f ingress/deploy.yaml
```

And then the routes and default gateway:

```
kubectl apply -f ingress istio-routes.yaml
kubectl apply -f istio default-gateway.yaml
```

4. Create secrets

```
cd secrets
echo -c "<github username>" >> username
echo -c "<github token>" >> token
```

Generate the k8s secret
```
./create-secrets.sh
```

5. Start argo

```
kubectl apply -k argo
```

6. Create and sync applications

```
kustomize build applications/services | kubectl apply -f -
```

TODO: Why doesn't `kubectl apply -k` work in this case?
