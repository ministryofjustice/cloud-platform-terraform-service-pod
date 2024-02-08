module "service_pod" {
  source = "../" # use the latest release
  # source = "https://github.com/ministryofjustice/cloud-platform-terraform-service-pod?ref=version" # use the latest release

  # Configuration
  namespace            = var.namespace
  service_account_name = module.irsa.service_account.name # see irsa.tf for an example of irsa
}
