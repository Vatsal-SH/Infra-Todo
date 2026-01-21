variable resource_groups {
type = map(object({
    name       = string
    location   = string
    tags       = map(string)
    managed_by = string
  })) 
}
variable networks {
type = map(object({
    vnet_name           = string
    cidr                = list(string)
    location            = string
    resource_group_name = string
    tags                = map(string)
    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))   
}
variable pip_configs{
type = map(object({
    pip_name            = string
    resource_group_name = string
    location            = string
    allocation_method   = string
    tags                = map(string)
  })) 
}
variable azurerm_linux_vm {
  type = map(object({
   vm_name                = string
  resource_group_name = string
  location            = string
  vnet_name           = string
  subnet_name         = string
  pip_name            = string  
  nic_name            = string
  ip_configuration_name = string
  private_ip_address_allocation = string
  vm_size                       = string
  admin_username                = string
  admin_password                = string
  script_name                   = optional(string)
  disable_password_authentication = bool
  os_disk = object({
    caching              = string
    storage_account_type = string
  })
  source_image_reference = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  }))
}

variable mssqlserver {
  type = map(object({
    mssql_server_name            = string
    resource_group_name          = string
    location                     = string
    version                      = string
    administrator_login          = string
    administrator_login_password = string
  }))
}

variable mssqldatabase {
  type = map(object({
    mssql_database_name = string
    resource_group_name = string
    collation           = string
    license_type        = string
    max_size_gb         = number
    sku_name            = string
    enclave_type        = string
    mssql_server_name   = string
  }))
  }

variable "key_vaults" {
  type = map(object({
    kv_name                     = string
    location                    = string
    enabled_for_disk_encryption = bool
    soft_delete_retention_days  = number
    purge_protection_enabled    = optional(bool)
    sku_name                    = string
    resource_group_name         = string
    access_policy = optional(object({
      key_permissions     = list(string)
      secret_permissions  = list(string)
      storage_permissions = list(string)
    }))
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