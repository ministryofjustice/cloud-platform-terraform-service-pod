locals {
  # Generic configuration
  identifier = "cloud-platform-${random_id.name.hex}"
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
    name      = "${local.identifier}-service-pod"
    namespace = var.namespace

    labels = {
      app = "service-pod"
    }
  }

  spec {
    replicas = var.service_pod_count

    selector {
      match_labels = {
        app = "${local.identifier}-service-pod"
      }
    }

    template {
      metadata {
        labels = {
          app = "${local.identifier}-service-pod"
        }
      }

      spec {
        service_account_name = var.service_account_name
        container {
          image = "${data.aws_ecr_repository.service_pod.repository_url}:3cd7c4716d7aa467738281d03fc6f5ef363f84f5" # update this hash on a new Dockerfile release
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