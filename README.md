# cloud-platform-terraform-service-pod

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-service-pod/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-service-pod/releases)

This Terraform module will create a pod in a namespace that runs the `cloud-platform-service-pod` Docker image, which includes the AWS CLI v2.

## Usage

```hcl
module "service_pod" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-service-pod?ref=version" # use the latest release

  # Configuration
  namespace            = var.namespace
  service_account_name = module.irsa.service_account.name
}
```

See the [examples/](examples/) folder for more information.

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## Reading Material

- [Cloud Platform user guide](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)
