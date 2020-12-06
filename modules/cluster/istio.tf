
// module "istio_operator" {
//   source = "../../modules/istio-operator"

//   providers = {
//     kustomization = kustomization
//   }
// }

module "istio" {
  source = "../../modules/istio"

  // kustomization_path = "${path.root}/kustomize/modules/istio"
  // module_depends_on  = [module.istio_operator.installed]

  providers = {
    kustomization = kustomization
  }
}
