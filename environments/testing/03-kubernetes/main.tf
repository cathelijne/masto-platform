module "kubernetes" {
  source = "../../../modules/kubernetes"

  # Cluster
  doks_cluster_name    = "k8s-toot-community-testing-1"
  doks_cluster_version = "1.25.4-do.0"
  region               = "ams3"

  # Node pool - generic
  generic_pool_name      = "pool-generic-4"
  generic_pool_size      = "s-2vcpu-4gb"
  generic_pool_min_nodes = 1
  generic_pool_max_nodes = 1

  # Node pool - sidekiq
  sidekiq_pool_name      = "pool-sidekiq-3"
  sidekiq_pool_size      = "s-1vcpu-2gb"
  sidekiq_pool_min_nodes = 1
  sidekiq_pool_max_nodes = 1

  # Networking
  vpc_name = "ams3-vpc-toot-community-01"
}
