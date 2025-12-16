variable "networks" {
  type = map(object({
    vnet_name           = string
    resource_group_name = string
    location            = string
    cidr                = list(string)
    tags                = optional(map(string))
    subnets = optional(list(object(
      {
        name             = string
        address_prefixes = list(string)
      }
    )))
  }))
}
