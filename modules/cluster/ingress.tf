module "ingress" {
  source = "../../modules/ingress"

  providers = {
    kubernetes = kubernetes
    helm = helm
    kustomization = kustomization
  }
}
