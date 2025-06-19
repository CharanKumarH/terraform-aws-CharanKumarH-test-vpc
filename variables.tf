variable "vpc_config" {
  description = "VPC configuration including name and CIDR block."
  type = object({
    name       = string
    cidr_block = string
  })

  validation {
    condition     = can(cidrnetmask(var.vpc_config.cidr_block))
    error_message = "Invalid CIDR block: '${var.vpc_config.cidr_block}'. Must be a valid CIDR."
  }
}

variable "subnet_config" {
  description = "Map of subnet configurations keyed by subnet name."
  type = map(object({
    Name       = string
    cidr_block = string
    az         = string
    public     = optional(bool, false)
  }))

  validation {
    condition     = alltrue([for cfg in var.subnet_config : can(cidrnetmask(cfg.cidr_block))])
    error_message = "One or more subnet CIDR blocks are invalid."
  }
}
