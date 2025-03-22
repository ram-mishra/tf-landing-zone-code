variable "stg" {
  type = map(object({
    stg_name                 = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    tags                     = map(string)
    account_kind             = string
  }))
}