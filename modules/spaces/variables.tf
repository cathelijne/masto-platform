variable "spaces_name" {
  type        = string
  description = "Name of the Space"
}

variable "region" {
  type        = string
  description = "Name of the region to target"
  default     = "ams3"
}

variable "expiration_enabled" {
  type        = bool
  description = "Enable lifecycle policy (true/false)"
  default     = false
}

variable "cdn_enabled" {
  type        = bool
  description = "Enable CDN on Spaces bucket"
  default     = false
}
