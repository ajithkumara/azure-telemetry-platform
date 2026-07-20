variable "environment" {
  type        = string
  description = "Environment name (e.g. dev, test, prod)."
}

variable "location" {
  type        = string
  description = "Azure region."
}

variable "name_suffix" {
  type        = string
  description = "Suffix used for resource naming (e.g. telemetry)."
}

variable "storage_account_name" {
  type        = string
  description = "Name of the ADLS Gen2 storage account for external locations."
}

variable "access_connector_id" {
  type        = string
  description = "Resource ID of the Databricks Access Connector for storage credentials."
}

variable "databricks_host" {
  type        = string
  description = "Databricks workspace host URL (e.g. https://adb-xxx.azuredatabricks.net)."
}

variable "workspace_id" {
  type        = string
  description = "Numeric Databricks workspace ID."
}

variable "catalog_name" {
  type        = string
  description = "Name of the Unity Catalog catalog to manage."
}
