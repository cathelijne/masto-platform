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

  dynamic "cors_rule" {
    for_each = length(var.cors_hostname) > 0 ? [1] : []
    content {
      allowed_methods = ["GET"]
      allowed_origins = [join("", ["https://", var.cors_hostname])]
      max_age_seconds = 0
    }
  }
}

resource "digitalocean_certificate" "this" {
  count             = length(var.cdn_hostname) > 0 && length(var.existing_cdn_certificate) == 0 ? 1 : 0
  name              = "cf-origin-cert"
  type              = "custom"
  private_key       = file("../../../certificates/origin-cert.key")
  leaf_certificate  = file("../../../certificates/origin-cert.crt")
  certificate_chain = file("../../../certificates/origin_ca_rsa_root.pem")

  lifecycle {
    ignore_changes = [
      private_key
    ]
  }
}

resource "digitalocean_cdn" "this" {
  count            = length(var.cdn_hostname) > 0 ? 1 : 0
  origin           = digitalocean_spaces_bucket.this.bucket_domain_name
  custom_domain    = var.cdn_hostname
  certificate_name = length(var.existing_cdn_certificate) > 0 ? var.existing_cdn_certificate : digitalocean_certificate.this[0].name
}
