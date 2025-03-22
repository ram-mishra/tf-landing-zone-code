resource "azurerm_virtual_network" "vnet" {  # virtual network resource block
  for_each = var.vnets                        # for_each loop to iterate over the vnet map
    name = each.value.vnet-name               # name of the virtual network
    location = each.value.location            # location of the virtual network
    resource_group_name = each.value.rg-name   # resource group name
    address_space = each.value.address_space   # address space of the virtual network
    
    dynamic "subnet" {                         # dynamic block to create subnets
        for_each= each.value.subnets           # for_each loop to iterate over the subnets map
        content {                              # subnet block
            name = subnet.value.name            # name of the subnet
            address_prefixes = subnet.value.address_prefixes  # address prefixes of the subnet
        }
      
    }
  
}