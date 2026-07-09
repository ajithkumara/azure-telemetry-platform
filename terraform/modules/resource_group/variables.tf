variable "project_name" {
  type        = string
  description = "The name of the project."
}

variable "environment" {
  type        = string
  description = "The environment name (e.g. dev, test, prod)."
}

variable "location" {
  type        = string
  description = "The Azure region."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource."
}
