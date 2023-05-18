data "digitalocean_kubernetes_cluster" "this" {
  name = var.kubernetes_cluster_name
}

resource "digitalocean_database_firewall" "redis" {
  cluster_id = digitalocean_database_cluster.redis.id

  rule {
    type  = "k8s"
    value = data.digitalocean_kubernetes_cluster.this.id
  }
}

resource "digitalocean_database_firewall" "postgresql" {
  cluster_id = digitalocean_database_cluster.postgresql.id

  rule {
    type  = "k8s"
    value = data.digitalocean_kubernetes_cluster.this.id
  }

  # Temporary rule for the database migration
  # Can be removed once we run on the managed PSQL cluster
  rule {
    type  = "droplet"
    value = "355256406"
  }

  rule {
    type  = "ip_addr"
    value = "94.208.138.60"
  }
}
