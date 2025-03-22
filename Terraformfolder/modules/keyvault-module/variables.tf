variable "keyvault" {
    type = map(object({
      name = string
      resource_group_name = string
        location = string
        sku_name = string
        tenant_id = string
        enabled_for_deployment = bool
        enabled_for_disk_encryption = bool
        enabled_for_template_deployment = bool
        soft_delete_enabled = bool
        purge_protection_enabled = bool
        access_policies = list(object({
          tenant_id = string
          object_id = string
          secret_permissions = list(string)
          key_permissions = list(string)
          storage_permissions = list(string)


    }))
    }))
}
   