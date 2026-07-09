variable "project_name" {
  type        = string
  description = "The name of the project, used for naming resources."
  default     = "telemetry"
}

variable "environment" {
  type        = string
  description = "The deployment environment (e.g., dev, test, prod)."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created."
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default = {
    Project     = "Azure Telemetry Platform"
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}
