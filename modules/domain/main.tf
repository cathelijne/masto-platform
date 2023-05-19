resource "digitalocean_domain" "this" {
  name = var.name
}

resource "digitalocean_record" "this" {
  for_each = {for idx, record in var.records : md5("${record.name}-${record.type}-${record.value}") => record}

  domain   = digitalocean_domain.this.name
  type     = each.value.type
  value    = each.value.value
  name     = each.value.name
  port     = each.value.port
  priority = each.value.priority
  weight   = each.value.weight
  ttl      = coalesce(each.value.ttl, var.default_ttl)
  flags    = each.value.flags
  tag      = each.value.tag
}
