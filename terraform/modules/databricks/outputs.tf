output "workspace_url" {
  value       = azurerm_databricks_workspace.databricks.workspace_url
  description = "The URL of the Databricks workspace."
}

output "workspace_id" {
  value       = azurerm_databricks_workspace.databricks.workspace_id
  description = "The ID of the Databricks workspace."
}
