output "id" {
  value       = azurerm_databricks_access_connector.connector.id
  description = "The ID of the Databricks Access Connector."
}

output "principal_id" {
  value       = azurerm_databricks_access_connector.connector.identity[0].principal_id
  description = "The principal ID of the system assigned identity of the Access Connector."
}
