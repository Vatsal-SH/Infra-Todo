resource_groups = {
  rg1 = {
    name     = "rg-demo2"
    location = "East US"
    tags = {
      environment = "dev"
    }
    managed_by = "null"
  }
  rg2 = {
    name     = "rg-demo-india"
    location = "central india"
    tags = {
      environment = "dev"
    }
    managed_by = "null"
  }
}
networks_vnet = {
  vnet1 = {
    vnet_name           = "vnet-demo"
    cidr                = ["10.0.0.0/16"]
    location            = "East US"
    resource_group_name = "rg-demo"
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}
pip_configs = {
  pip1 = {
    pip_name            = "IP1-dev"
    resource_group_name = "rg-demo"
    location            = "East US"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
    }
  }
  pip2 = {
    pip_name            = "IP2-dev"
    resource_group_name = "rg-demo"
    location            = "East US"
    allocation_method   = "Static"
    tags = {
      environment = "dev"
    }
} }
azurerm_linux_vm = {
  vm1 = {
    vm_name                         = "vm-dev-01"
    resource_group_name             = "rg-demo"
    location                        = "East US"
    vnet_name                       = "vnet-demo"
    subnet_name                     = "frontend-subnet"
    pip_name                        = "IP1-dev"
    nic_name                        = "nic-demo-01"
    ip_configuration_name           = "ipconfig1"
    private_ip_address_allocation   = "Dynamic"
    vm_size                         = "Standard_B1s"
    admin_username                  = "adminuser"
    admin_password                  = "P@ssw0rd1234!"
    script_name                     = "nginx.sh"
    disable_password_authentication = false
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    vm_name                         = "vm-dev-02"
    resource_group_name             = "rg-demo"
    location                        = "East US"
    vnet_name                       = "vnet-demo"
    subnet_name                     = "backend-subnet"
    pip_name                        = "IP2-dev"
    nic_name                        = "nic-demo-02"
    ip_configuration_name           = "ipconfig2"
    private_ip_address_allocation   = "Dynamic"
    vm_size                         = "Standard_B1s"
    admin_username                  = "adminuser"
    admin_password                  = "P@ssw0rd1234!"
    disable_password_authentication = false
    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}
mssqlserver = {
  mssql1 = {
    mssql_server_name            = "mssql-dev-01"
    resource_group_name          = "rg-demo-india"
    location                     = "central india"
    version                      = "12.0"
    administrator_login          = "sqladmin"
    administrator_login_password = "P@ssw0rd1234!"
  }
}
mssqldatabase = {
  db1 = {
    mssql_database_name = "sqldb-dev-01"
    resource_group_name = "rg-demo-india"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 10
    sku_name            = "S0"
    enclave_type        = "Default"
    mssql_server_name   = "mssql-dev-01"
  }
}
key_vaults = {
  kv1 = {
    kv_name                     = "kv-dev-fjety"
    resource_group_name         = "rg-demo"
    location                    = "East US"
    sku_name                    = "standard"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
    access_policy = {
      key_permissions     = ["Get", "List", "Create"]
      secret_permissions  = ["Get", "List", "Set", "Delete", "Recover", "Backup", "Restore", "Purge"]
      storage_permissions = ["Get"]
    }
  }
}
acr_configs = {
  acr1 = {
    acr_name            = "devacr1nyt"
    resource_group_name = "rg-demo"
    location            = "East US"
    sku                 = "Standard"
    admin_enabled       = false
  }
}

aks_clusters = {
  aks1 = {
    cluster_name        = "devaks1"
    location            = "East US"
    resource_group_name = "rg-demo"
    dns_prefix          = "devdaks"
    identity = {
      type = "SystemAssigned"
    }
    default_node_pool = [{
      name       = "nodepool1"
      node_count = 1
      vm_size    = "Standard_a2_v2"
    }]
    tags = {
      environment = "production"
    }
  }
}

