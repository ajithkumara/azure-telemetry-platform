resource "azurerm_eventhub_namespace" "ehns" {
  name                = "ehns-${local.name_suffix}"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"
  capacity            = 1

  tags = var.tags
}

resource "azurerm_eventhub" "hub" {
  name                = "telemetryhub"
  namespace_name      = azurerm_eventhub_namespace.ehns.name
  resource_group_name = azurerm_resource_group.rg.name
  partition_count     = 2
  message_retention   = 1
}

# Explicitly provision a custom consumer group
resource "azurerm_eventhub_consumer_group" "bronze_loader" {
  name                = "bronze-loader"
  namespace_name      = azurerm_eventhub_namespace.ehns.name
  eventhub_name       = azurerm_eventhub.hub.name
  resource_group_name = azurerm_resource_group.rg.name
}

# Authorization Rule for Event Hub Producer (Send only)
resource "azurerm_eventhub_authorization_rule" "sender" {
  name                = "telemetry-sender"
  namespace_name      = azurerm_eventhub_namespace.ehns.name
  eventhub_name       = azurerm_eventhub.hub.name
  resource_group_name = azurerm_resource_group.rg.name
  listen              = false
  send                = true
  manage              = false
}

# Authorization Rule for Event Hub Consumer (Listen only)
resource "azurerm_eventhub_authorization_rule" "reader" {
  name                = "telemetry-reader"
  namespace_name      = azurerm_eventhub_namespace.ehns.name
  eventhub_name       = azurerm_eventhub.hub.name
  resource_group_name = azurerm_resource_group.rg.name
  listen              = true
  send                = false
  manage              = false
}
