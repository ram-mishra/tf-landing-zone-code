variable "rg-groups" {
  type = map(object({
    rg-name     = string
    location    = string
    environment = string
    owner       = string
    cost_center = string
    application = string
    department  = string
    project     = string

  }))

}

variable "vnet-groups" {
  type = map(object({
    vnet-name     = string
    location      = string
    rg-name       = string
    address_space = list(string)
    subnets = list(object({
      name             = string
      address_prefixes = list(string)
    }))
  }))

}
variable "vm-groups" {
  type = map(object({
    vm-name        = string
    nic-name       = string
    subnet-name    = string
    vnet-name      = string
    rg-name        = string
    location       = string
    vm-size        = string
    admin_username = string
    admin_password = string
    os_disk = object({
      disk_size_gb         = number
      storage_account_type = string
    })
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))

}

variable "subscription_id" {
  type = string
}

variable "bastion-groups" {
  type = map(object({
    bastion-name   = string
    location       = string
    rg-name        = string
    vnet-name      = string
    public-ip-name = string
    sku            = string
    tags           = map(string)
  }))

}
variable "akscluster-groups" {
  type = map(object({
    name               = string
    location           = string
    rg-name            = string
    dns_prefix         = string
    kubernetes_version = string
    default_node_pool = list(object({
      name            = string
      node_count      = number
      vm_size         = string
      os_disk_size_gb = number
      type            = string
      
    }))
  }))

}

variable "storage-groups" {
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