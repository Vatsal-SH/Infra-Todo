variable "aks_clusters" {
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

