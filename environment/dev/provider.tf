terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "4.49.0"
        }
    }

    backend "azurerm" {
    resource_group_name   = "tfstate-dev-rg"
    storage_account_name  = "tfstatedevstorage1"
    container_name        = "tfstatecontainer"
    key                   = "dev.terraform.tfstate"
    }
}
    provider "azurerm" {
        features {}
        subscription_id = "93b568fd-bf85-44bc-8f71-c314751c396d"
    }
