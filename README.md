# E2E k8s deploy experiment

## Bootstrapping the cluster

1. Spin up kind cluster

```
kind create cluster --config kind/cluster.yaml
```

2. Install istio:

```
brew install istioctl
istioctl install --set profile=demo -y
```

3. Bootstrap the cluster:

```
cd cluster/ && terraform apply
```

4. Create secrets

```
cd secrets
echo -n "<github username>" >> username
echo -n "<github token>" >> token
```

Generate the k8s secret
```
./create-secrets.sh
```

5. Create and sync applications

```
kustomize build applications/services | kubectl apply -f -
```

TODO: Why doesn't `kubectl apply -k` work in this case?
