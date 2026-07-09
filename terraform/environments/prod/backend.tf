# Local backend config for local development and testing.
# To migrate to Azure Remote Backend, uncomment the block below and run:
# terraform init -migrate-state

terraform {
  backend "local" {
    path = "terraform.tfstate"
  }

  # Example Azure Storage Backend Configuration:
  # backend "azurerm" {
  #   resource_group_name  = "rg-terraform-state"
  #   storage_account_name = "sttfstateprod"
  #   container_name       = "tfstate"
  #   key                  = "prod.terraform.tfstate"
  # }
}
