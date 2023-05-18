module "spaces" {
  source = "../../../modules/spaces"

  spaces_name = "static-toot-community"
  region      = "ams3"
  cdn_enabled = true
}

module "spaces-backups" {
  source = "../../../modules/spaces"

  spaces_name = "backup-toot-community"
  region      = "ams3"

  expiration_enabled = true
}
