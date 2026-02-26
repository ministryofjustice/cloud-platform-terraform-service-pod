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
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.0.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.0.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 2.0.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.service_pod](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [random_id.name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [aws_ecr_repository.service_pod](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ecr_repository) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace name to create the pod | `string` | n/a | yes |
| <a name="input_override_deployment_name"></a> [override\_deployment\_name](#input\_override\_deployment\_name) | Optional custom name for the deployment (if not specified, will be auto-generated). Must be 63 characters or less. | `string` | `""` | no |
| <a name="input_service_account_name"></a> [service\_account\_name](#input\_service\_account\_name) | Name of the service account to attach to the pod | `string` | n/a | yes |
| <a name="input_service_pod_count"></a> [service\_pod\_count](#input\_service\_pod\_count) | Amount of service pods to create (default: 1) | `number` | `1` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Reading Material

- [Cloud Platform user guide](https://user-guide.cloud-platform.service.justice.gov.uk/#cloud-platform-user-guide)
