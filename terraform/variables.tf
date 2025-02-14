variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  sensitive   = true
}

variable "cluster_name" {
  description = "DOKS cluster name"
  type        = string
  default     = "mono-cluster"
}

variable "region" {
  description = "DigitalOcean region used"
  type        = string
  default     = "nyc1"
}

variable "k8s_version" {
  description = "Kubernetes version being used"
  type        = string
  default     = "1.29.1-do.0"
}

variable "node_pool_size" {
  description = "Worker node size"
  type        = string
  default     = "s-2vcpu-4gb"
}

variable "node_count" {
  description = "Number of worker nodes"
  type        = number
  default     = 2
}
