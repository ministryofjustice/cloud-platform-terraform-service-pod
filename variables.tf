#################
# Configuration #
#################
variable "namespace" {
  description = "Namespace name to create the pod"
  type        = string
}

variable "service_account_name" {
  description = "Name of the service account to attach to the pod"
  type        = string
}

variable "service_pod_count" {
  description = "Amount of service pods to create (default: 1)"
  default     = 1
  type        = number
}
