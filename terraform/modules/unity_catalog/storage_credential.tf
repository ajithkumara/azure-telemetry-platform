resource "databricks_storage_credential" "external_mi" {
  name = "mi_credential_${var.name_suffix}"
  azure_managed_identity {
    access_connector_id = var.access_connector_id
  }
}
