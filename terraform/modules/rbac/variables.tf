variable "scope" {
  type        = string
  description = "The scope at which the role assignment should be applied (e.g., storage account ID)."
}

variable "principal_id" {
  type        = string
  description = "The principal ID of the identity receiving the role assignment."
}

variable "role_definition_name" {
  type        = string
  description = "The name of the role to assign."
  default     = "Storage Blob Data Contributor"
}
