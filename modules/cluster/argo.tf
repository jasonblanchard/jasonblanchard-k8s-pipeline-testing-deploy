module "argo" {
  source = "../../modules/argo"

  providers = {
    kubernetes = kubernetes
    kustomization = kustomization
  }
}
