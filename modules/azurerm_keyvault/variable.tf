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
