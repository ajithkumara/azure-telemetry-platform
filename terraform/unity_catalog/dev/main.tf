module "unity_catalog" {
  source               = "../../modules/unity_catalog"
  environment          = var.environment
  location             = var.location
  name_suffix          = var.name_suffix
  storage_account_name = var.storage_account_name
  access_connector_id  = var.access_connector_id
  databricks_host      = var.databricks_host
  workspace_id         = var.workspace_id
  catalog_name         = var.catalog_name
}
