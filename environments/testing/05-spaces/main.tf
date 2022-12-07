module "spaces" {
  source = "../../../modules/spaces"

  spaces_name   = "test-files-toot-community"
  region        = "ams3"
  cdn_hostname  = "test-files.toot.community"
  cors_hostname = "test.toot.community"

  existing_cdn_certificate = "cf-origin-cert"
}
