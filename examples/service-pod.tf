module "service_pod" {
  source = "../"

  # Configuration
  namespace            = var.namespace
  service_account_name = module.irsa.service_account.name # see irsa.tf for an example of irsa
}
