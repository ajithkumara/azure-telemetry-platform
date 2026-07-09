resource "azurerm_databricks_workspace" "databricks" {
  name                = "dbw-${var.name_suffix}"
  resource_group_name = var.resource_group_name
  location            = var.location
  sku                 = "standard"

  tags = var.tags
}

# Note: Unity Catalog configurations (Storage Credentials, External Locations, Catalogs, etc.)
# can be added here using the databricks provider once the workspace is provisioned.
