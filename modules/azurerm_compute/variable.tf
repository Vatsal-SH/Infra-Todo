variable "vms" {
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

  
