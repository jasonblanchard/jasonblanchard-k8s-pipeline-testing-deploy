provider "kustomization" {
  // kubeconfig_raw = module.truss_cluster.kubeconfig
}

provider "helm" {
  // kubernetes {
  //   config_path = "${path.root}/kubeconfig-truss-dev-cmh-shared-cluster.yaml"
  // }
}

provider "kubernetes" {}
