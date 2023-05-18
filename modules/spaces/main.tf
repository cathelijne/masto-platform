resource "digitalocean_spaces_bucket" "this" {
  name   = var.spaces_name
  region = var.region
  acl    = "private"

  dynamic "lifecycle_rule" {
    for_each = var.expiration_enabled == true ? [1] : []
    content {
      id      = "${var.spaces_name}-lifecycle-rule"
      enabled = true
      expiration {
        days = 7
      }
      noncurrent_version_expiration {
        days = 7
      }
    }
  }
}

resource "digitalocean_cdn" "this" {
  count  = var.cdn_enabled ? 1 : 0
  origin = digitalocean_spaces_bucket.this.bucket_domain_name
}
