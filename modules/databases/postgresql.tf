resource "digitalocean_database_cluster" "postgresql" {
  engine               = "pg"
  name                 = var.db_cluster_name
  version              = var.db_cluster_version
  node_count           = var.db_node_count
  region               = var.region
  size                 = var.db_cluster_size
  private_network_uuid = data.digitalocean_vpc.this.id
}

resource "digitalocean_database_user" "postgresql" {
  for_each   = {for username in var.db_usernames : username => username}
  cluster_id = digitalocean_database_cluster.postgresql.id
  name       = each.value
}

resource "digitalocean_database_db" "postgresql" {
  for_each   = {for database in var.db_usernames : database => database}
  cluster_id = digitalocean_database_cluster.postgresql.id
  name       = each.value
}

resource "digitalocean_database_connection_pool" "postgresql" {
  for_each = {for idx, pool in var.db_connection_pools : pool.name => pool}

  cluster_id = digitalocean_database_cluster.postgresql.id
  db_name    = each.value.database
  user       = each.value.user
  mode       = each.value.mode
  name       = each.value.name
  size       = each.value.size
}
