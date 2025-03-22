resource "azurerm_key_vault" "keyvault" {
   for_each = var.keyvault
    name                = each.value.name
    resource_group_name = azurerm_resource_group.rg.rg-name
    location            = azurerm_resource_group.rg.location
    sku_name            = each.value.sku_name
    tenant_id           = each.value.tenant_id
    enabled_for_deployment = each.value.enabled_for_deployment
    enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
    enabled_for_template_deployment = each.value.enabled_for_template_deployment
    purge_protection_enabled = each.value.purge_protection_enabled
    access_policy {
        tenant_id = each.value.access_policies[0].tenant_id
        object_id = each.value.access_policies[0].object_id
        secret_permissions = each.value.access_policies[0].secret_permissions
        key_permissions = each.value.access_policies[0].key_permissions
        storage_permissions = each.value.access_policies[0].storage_permissions
    }
}
resource "azurerm_key_vault_secret" "keyvault_secret" {
    for_each = var.keyvault
    name         = each.value.name
    key_vault_id = azurerm_key_vault.keyvault[each.key].id
    value        =  each.value.value
    content_type = each.value.content_type
    tags         = each.value.tags
  
}