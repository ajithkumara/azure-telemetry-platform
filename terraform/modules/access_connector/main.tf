resource "azurerm_databricks_access_connector" "connector" {
  name                = "dbac-${var.name_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}
