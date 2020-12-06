data "kustomization" "istio" {
  path = "${path.module}/kustomize"
}

resource "kustomization_resource" "istio" {
  for_each = data.kustomization.istio.ids
  manifest = data.kustomization.istio.manifests[each.value]
}
