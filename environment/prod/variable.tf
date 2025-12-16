variable resource_groups {
type = map(object({
    name       = string
    location   = string
    tags       = map(string)
    managed_by = string
  })) 
}

variable "aks_clusters" {
  description = "The name of the AKS Cluster"
  type = map(object({
    cluster_name        = string
    location            = string
    resource_group_name = string
    dns_prefix          = optional(string)
    default_node_pool = list(object({
      name       = string
      node_count = number
      vm_size    = string
    }))
    identity = object({
      type = string
    })
    tags = map(string)
  }))
}

variable "acr_configs" {
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