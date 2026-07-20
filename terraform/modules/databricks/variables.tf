variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "name_suffix" {
  type        = string
  description = "The suffix for naming resources (e.g. project-env)."
}

variable "storage_account_name" {
  description = "The name of the storage account to link via Unity Catalog."
  type        = string
}

variable "access_connector_id" {
  description = "The ID of the Databricks Access Connector."
  type        = string
}
