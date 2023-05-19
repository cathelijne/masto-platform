# Postgresql
variable "db_cluster_name" {
  type        = string
  description = "Name of the DB cluster"
}

variable "db_cluster_version" {
  type        = string
  description = "Engine version used by the DB cluster (ex. 14 for PostgreSQL 14)"
}

variable "db_node_count" {
  type        = string
  description = "Number of nodes in the DB cluster"
}

variable "db_cluster_size" {
  type        = string
  description = "Sizing of the DB cluster"
}

variable "db_usernames" {
  type        = list(string)
  description = "Names of the users to create on the DB cluster"
}

variable "db_names" {
  type        = list(string)
  description = "names of the databases to create on the DB cluster"
}

variable "db_connection_pools" {
  type = list(object({
    name     = string
    size     = string
    user     = string
    database = string
    mode     = string
  }))
  description = "List of connection pools to create in the database cluster"
}

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
