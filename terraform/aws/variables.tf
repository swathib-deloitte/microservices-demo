variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
  default     = "scenario2"
}

variable "replicas" {
  description = "Number of Nginx replicas"
  type        = number
  default     = 2
}
