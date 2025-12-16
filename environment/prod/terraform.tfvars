resource_groups = {
  rg1 = {
    name     = "rg-demo"
    location = "East US"
    tags = {
      environment = "demo"
    }
    managed_by = "null"
  }
}


acr_configs = {
  acr1 = {
    acr_name            = "prodacr1nyt"
    resource_group_name = "rg_demo"
    location            = "central india"
    sku                 = "Standard"
    admin_enabled       = false
  }
}

aks_clusters = {
  aks1 = {
    cluster_name        = "prodaks1"
    location            = "central india"
    resource_group_name = "rg_demo"
    dns_prefix          = "prodaks"
    identity = {
      type = "SystemAssigned"
    }
    default_node_pool= [{
      name       = "nodepool1"
      node_count = 1
      vm_size    = "Standard_a2_v2"
    }]
    tags = {
      environment = "production"
    }
  }
}
