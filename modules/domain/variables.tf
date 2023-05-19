variable "name" {
  type        = string
  description = "Name of the domain"
}

variable "records" {
  type = list(object({
    type     = string
    value    = string
    name     = string
    port     = optional(number)
    priority = optional(number)
    weight   = optional(number)
    ttl      = optional(number)
    flags    = optional(number)
    tag      = optional(string)
  }))
  description = "List of records to create in the domain"
}

variable "default_ttl" {
  type        = number
  description = "Default TTL for the domain"
  default     = 1800
}
