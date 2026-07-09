resource "azurerm_user_assigned_identity" "telemetry_identity" {
  name                = "id-${local.name_suffix}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

  tags = var.tags
}

# Assign Storage Blob Data Contributor role to the managed identity for the storage account
resource "azurerm_role_assignment" "storage_blob_contributor" {
  scope                = azurerm_storage_account.storage.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.telemetry_identity.principal_id
}
