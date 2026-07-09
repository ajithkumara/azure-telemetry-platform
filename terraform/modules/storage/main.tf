resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  is_hns_enabled           = true # Enable hierarchical namespace for ADLS Gen2

  tags = var.tags
}

resource "azurerm_storage_data_lake_gen2_filesystem" "datalake" {
  name               = "datalake"
  storage_account_id = azurerm_storage_account.storage.id
}

resource "azurerm_storage_data_lake_gen2_filesystem" "checkpoint" {
  name               = "checkpoint"
  storage_account_id = azurerm_storage_account.storage.id
}
