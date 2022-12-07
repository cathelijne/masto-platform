variable "spaces_name" {
  type        = string
  description = "Name of the Space"
}

variable "region" {
  type        = string
  description = "Name of the region to target"
  default     = "ams3"
}

variable "cdn_hostname" {
  type        = string
  description = "(Optional) Hostname for the CDN"
  default     = ""
}

variable "cors_hostname" {
  type        = string
  description = "(Optional) Hostname to trust for CORS"
  default     = ""
}

variable "expiration_enabled" {
  type        = bool
  description = "Enable lifecycle policy (true/false)"
  default     = false
}

variable "existing_cdn_certificate" {
  type        = string
  default     = ""
  description = "Name of the existing certificate to use for the CDN"
}
