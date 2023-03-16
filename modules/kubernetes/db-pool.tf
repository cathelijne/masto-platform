resource "digitalocean_kubernetes_node_pool" "db_pool" {
  cluster_id = digitalocean_kubernetes_cluster.this.id

  name       = var.db_pool_name
  size       = var.db_pool_size
  auto_scale = true
  min_nodes  = var.db_pool_min_nodes
  max_nodes  = var.db_pool_max_nodes

  taint {
    key    = "limit"
    value  = "db"
    effect = "NoSchedule"
  }
}
