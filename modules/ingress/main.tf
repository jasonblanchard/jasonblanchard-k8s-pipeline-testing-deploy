data "kustomization" "ingress-nginx" {
  path = "${path.module}/kustomize/ingress-nginx"
}

resource "kustomization_resource" "ingress-nginx" {
  for_each = data.kustomization.ingress-nginx.ids
  manifest = data.kustomization.ingress-nginx.manifests[each.value]
}

data "kustomization" "istio-ingress" {
  path = "${path.module}/kustomize/istio-ingress"
}

resource "time_sleep" "wait_for_ingress_controller" {
  depends_on = [kustomization_resource.ingress-nginx]
  create_duration = "30s"
}

resource "kustomization_resource" "istio-ingress" {
  for_each = data.kustomization.istio-ingress.ids
  manifest = data.kustomization.istio-ingress.manifests[each.value]

  depends_on = [time_sleep.wait_for_ingress_controller]
}
