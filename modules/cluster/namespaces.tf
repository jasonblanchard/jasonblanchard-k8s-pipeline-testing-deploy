resource "kubernetes_namespace" "edge" {
  metadata {
    name = "edge"
  }
}

resource "kubernetes_namespace" "production" {
  metadata {
    name = "production"
  }
}
