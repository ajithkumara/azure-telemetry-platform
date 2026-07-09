# Local variables used to construct resource names and define common patterns
locals {
  name_suffix        = "${var.project_name}-${var.environment}"
  name_suffix_alphanumeric = replace(local.name_suffix, "-", "")
  
  # Ensure storage account name is valid (lowercase, alphanumeric, max 24 chars)
  # st + suffix (max 22 chars)
  storage_account_name = lower(substr("st${local.name_suffix_alphanumeric}", 0, 24))
}
