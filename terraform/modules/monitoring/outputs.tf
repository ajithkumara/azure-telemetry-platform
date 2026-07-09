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
