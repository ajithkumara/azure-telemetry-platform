output "resource_group_name" {
  value       = azurerm_resource_group.rg.name
  description = "The name of the resource group."
}

output "storage_account_name" {
  value       = azurerm_storage_account.storage.name
  description = "The name of the ADLS Gen2 storage account."
}

output "storage_account_primary_connection_string" {
  value       = azurerm_storage_account.storage.primary_connection_string
  description = "The primary connection string for the storage account."
  sensitive   = true
}

output "eventhub_namespace_name" {
  value       = azurerm_eventhub_namespace.ehns.name
  description = "The Event Hub namespace name."
}

output "eventhub_name" {
  value       = azurerm_eventhub.hub.name
  description = "The Event Hub name."
}

output "eventhub_producer_connection_string" {
  value       = azurerm_eventhub_authorization_rule.sender.primary_connection_string
  description = "Connection string for telemetry sender (producer)."
  sensitive   = true
}

output "eventhub_consumer_connection_string" {
  value       = azurerm_eventhub_authorization_rule.reader.primary_connection_string
  description = "Connection string for telemetry reader (consumer)."
  sensitive   = true
}

output "databricks_workspace_url" {
  value       = azurerm_databricks_workspace.databricks.workspace_url
  description = "The URL of the Databricks workspace."
}

output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.log_analytics.workspace_id
  description = "The Workspace ID of the Log Analytics workspace."
}

output "app_insights_instrumentation_key" {
  value       = azurerm_application_insights.app_insights.instrumentation_key
  description = "The Instrumentation Key of the Application Insights instance."
  sensitive   = true
}

output "app_insights_connection_string" {
  value       = azurerm_application_insights.app_insights.connection_string
  description = "The Connection String of the Application Insights instance."
  sensitive   = true
}
