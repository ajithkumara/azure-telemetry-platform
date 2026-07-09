variable "project_name" {
  type        = string
  description = "The name of the project."
  default     = "telemetry"
}

variable "environment" {
  type        = string
  description = "The environment name (e.g. dev, test, prod)."
  default     = "dev"
}

variable "location" {
  type        = string
  description = "The Azure region."
  default     = "eastus"
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
  default = {
    Project     = "Azure Telemetry Platform"
    ManagedBy   = "Terraform"
    Environment = "dev"
  }
}
