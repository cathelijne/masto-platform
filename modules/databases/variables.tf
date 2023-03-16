# Redis
variable "redis_cluster_name" {
  type        = string
  description = "Name of the Redis cluster"
}

variable "redis_cluster_version" {
  type        = string
  description = "Engine version used by the Redis cluster"
}

variable "redis_node_count" {
  type        = string
  description = "Number of nodes in the Redis cluster"
}

variable "redis_cluster_size" {
  type        = string
  description = "Sizing of the DB cluster"
}

variable "region" {
  type        = string
  description = "Name of the region to target"
  default     = "ams3"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC to put the resources in"
}

variable "kubernetes_cluster_name" {
  type        = string
  description = "Name of the Kubernetes cluster to trust incoming connections from"
}
