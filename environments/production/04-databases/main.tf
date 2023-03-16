module "databases" {
  source = "../../../modules/databases"

  # Redis
  redis_cluster_name    = "db-redis-ams3-toot-community"
  redis_cluster_version = "7"
  redis_node_count      = "1"
  redis_cluster_size    = "db-s-2vcpu-4gb"

  # Networking
  vpc_name = "ams3-vpc-toot-community-01"

  # Kubernetes
  kubernetes_cluster_name = "k8s-toot-community-1"
}
