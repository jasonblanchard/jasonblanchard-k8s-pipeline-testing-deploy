data "kustomization" "istio-operator" {
  path = "${path.module}/kustomize"
}

resource "kustomization_resource" "istio-operator" {
  for_each = data.kustomization.istio-operator.ids
  manifest = data.kustomization.istio-operator.manifests[each.value]
}

output "installed" {
  value      = "true"
  depends_on = [kustomization_resource.istio_operator]
}
