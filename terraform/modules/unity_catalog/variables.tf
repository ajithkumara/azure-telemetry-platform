variable "name_suffix" {
  description = "Suffix to append to resource names."
  type        = string
}

variable "access_connector_id" {
  description = "The ID of the Databricks Access Connector."
  type        = string
}

variable "storage_account_name" {
  description = "The name of the Azure Data Lake Storage account."
  type        = string
}

variable "environment" {
  description = "The environment for the Unity Catalog (e.g., dev, test, prod)."
  type        = string
}

variable "location" {
  description = "Azure region location."
  type        = string
}

variable "databricks_host" {
  description = "Databricks workspace host URL."
  type        = string
}

variable "workspace_id" {
  description = "Databricks workspace ID."
  type        = string
}

variable "catalog_name" {
  description = "Name of the catalog to create."
  type        = string
}
