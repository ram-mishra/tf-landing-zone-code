data "azurerm_subnet" "example" {
  for_each            = var.vms
  name                = each.value.subnet-name
  virtual_network_name = each.value.vnet-name
  resource_group_name = each.value.rg-name
}
