module "cluster" {
  source = "../modules/cluster"

  providers = {
    kustomization = kustomization
    kubernetes = kubernetes
    helm = helm
  }
}
