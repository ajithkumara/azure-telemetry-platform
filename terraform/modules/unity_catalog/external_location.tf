resource "databricks_external_location" "datalake" {
  name            = "datalake_external_location"
  url             = "abfss://datalake@${var.storage_account_name}.dfs.core.windows.net/"
  credential_name = databricks_storage_credential.external_mi.id
}
