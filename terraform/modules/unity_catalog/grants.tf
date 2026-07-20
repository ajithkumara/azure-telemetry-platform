resource "databricks_grants" "external_location_grants" {
  external_location = databricks_external_location.datalake.id
  grant {
    principal  = "account users"
    privileges = ["READ_FILES", "WRITE_FILES", "CREATE_EXTERNAL_TABLE", "CREATE_MANAGED_STORAGE"]
  }
}
