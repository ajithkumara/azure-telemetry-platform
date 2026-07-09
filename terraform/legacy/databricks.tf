resource "azurerm_databricks_workspace" "databricks" {
  name                = "dbw-${local.name_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  sku                 = "standard"

  tags = var.tags
}
