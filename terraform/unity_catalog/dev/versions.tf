terraform {
  required_providers {
    databricks = {
      source  = "databricks/databricks"
      version = "~> 1.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-terraform"
    storage_account_name = "stteraformstateajith2026"
    container_name       = "terraformstate"
    key                  = "unity-catalog-dev.terraform.tfstate"
  }
}
