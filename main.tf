locals {
  # Generic configuration
  identifier = "cp-${random_id.name.hex}"
}

########################
# Generate identifiers #
########################
resource "random_id" "name" {
  byte_length = 8
}

#########################
# Get service pod image #
#########################
data "aws_ecr_repository" "service_pod" {
  name = "webops/cloud-platform-service-pod"
}

################################
# Create Kubernetes deployment #
################################
resource "kubernetes_deployment" "service_pod" {
  metadata {
    name      = ${var.service_account_name} == "" ? "${local.identifier}-service-pod" : "${var.service_account_name}-service-pod"
    namespace = var.namespace

    labels = {
      app = "service-pod"
    }
  }

  spec {
    replicas = var.service_pod_count

    selector {
      match_labels = {
        app = "${local.identifier}-${var.service_account_name}-service-pod"
      }
    }

    template {
      metadata {
        labels = {
    name      = ${var.service_account_name} == "" ? "${local.identifier}-service-pod" : "${var.service_account_name}-service-pod"
        }
      }

      spec {
        service_account_name = var.service_account_name
        container {
          image = "${data.aws_ecr_repository.service_pod.repository_url}:c5f69b4624b956248001fa7c173c89a0556a457e" # update this hash on a new Dockerfile release
          name  = "service-pod"
          stdin = true
          tty   = true

          security_context {
            allow_privilege_escalation = false
            run_as_non_root            = true
            run_as_user                = 1001
          }
        }
      }
    }
  }

  lifecycle {
    ignore_changes = [
      spec.0.replicas
    ]
  }
}