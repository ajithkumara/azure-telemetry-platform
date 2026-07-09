resource "azurerm_log_analytics_workspace" "log_analytics" {
  name                = "law-${local.name_suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30

  tags = var.tags
}

resource "azurerm_application_insights" "app_insights" {
  name                = "appi-${local.name_suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  workspace_id        = azurerm_log_analytics_workspace.log_analytics.id
  application_type    = "web"

  tags = var.tags
}
