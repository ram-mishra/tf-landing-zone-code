data "azurerm_subnet" "example" {
  for_each            = var.bastions
  name                = "AzureBastionSubnet"
  resource_group_name = each.value.rg-name
  virtual_network_name = each.value.vnet-name
  
}
