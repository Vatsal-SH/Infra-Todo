variable "acr_configs" {
  description = "A map of ACR configurations"
  type = map(object({
    acr_name             = string
    resource_group_name  = string
    location             = string
    sku                  = string
    admin_enabled        = optional(bool)
    georeplications     = optional(list(object({
      location                = string
      zone_redundancy_enabled = optional(bool)
      tags                    = optional(map(string))
    })))
  }))
}