resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
}

data "kustomization" "argo" {
  path = "${path.module}/kustomize"
}

resource "kustomization_resource" "argo" {
  for_each = data.kustomization.argo.ids
  manifest = data.kustomization.argo.manifests[each.value]

  depends_on = [kubernetes_namespace.argocd]
}
