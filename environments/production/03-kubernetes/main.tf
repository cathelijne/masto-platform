module "kubernetes" {
  source = "../../../modules/kubernetes"

  # Cluster
  doks_cluster_name    = "k8s-toot-community-1"
  doks_cluster_version = "1.25.4-do.0"
  region               = "ams3"
  high_availability    = true

  # Node pool - generic
  generic_pool_name      = "pool-generic-3"
  generic_pool_size      = "s-4vcpu-8gb-amd"
  generic_pool_min_nodes = 2
  generic_pool_max_nodes = 12

  # Node pool - sidekiq
  sidekiq_pool_name      = "pool-sidekiq-3"
  sidekiq_pool_size      = "s-4vcpu-8gb-amd"
  sidekiq_pool_min_nodes = 1
  sidekiq_pool_max_nodes = 6

  # Node pool - db
  db_pool_name      = "pool-db-1"
  db_pool_size      = "s-4vcpu-8gb-amd"
  db_pool_min_nodes = 2
  db_pool_max_nodes = 4

  # Networking
  vpc_name = "ams3-vpc-toot-community-01"
}
