module "databases" {
  source = "../../../modules/databases"

  # PostgreSQL
  db_cluster_name    = "db-postgresql-ams3-toot-community"
  db_cluster_version = "15"
  db_node_count      = "1"
  db_cluster_size    = "db-s-4vcpu-8gb"

  # Databases & Users
  db_usernames = ["app", "esb"]
  db_names     = ["app", "esb"]

  # Pools
  db_connection_pools = [
    {
      name     = "app-pool"
      size     = 194,
      mode     = "transaction",
      user     = "app",
      database = "app"
    },
    {
      name     = "esb-pool"
      size     = 3,
      mode     = "transaction",
      user     = "esb",
      database = "esb"
    }
  ]

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
