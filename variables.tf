variable "rules" {
  description = "list of firewall rules"
  type = set(object({
    name                    = string
    direction               = string
    protocol                = string
    priority                = number
    ports                   = list(string)
    source_ranges           = list(string)
    destination_ranges      = list(string)
    source_tags             = list(string)
    target_tags             = list(string)
    use_service_accounts    = bool
    source_service_accounts = list(string)
    target_service_accounts = list(string)
  }))
}

variable "network" {
  description = "name of network"
  type        = string
}

variable "project_id" {
  description = "project id"
  type        = string
}

variable "log_config_metadata" {
  description = "Supports `INCLUDE_ALL_METADATA` or `EXCLUDE_ALL_METADATA` If not provided will default to `INCLUDE_ALL_METADATA`"
  type        = string
  default     = "INCLUDE_ALL_METADATA"
}
