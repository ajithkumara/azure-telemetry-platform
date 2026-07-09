variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the storage account."
}

variable "location" {
  type        = string
  description = "The Azure region where the storage account should exist."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}

variable "storage_account_name" {
  type        = string
  description = "The name of the storage account (must be unique, lowercase alphanumeric, 3-24 characters)."
}
