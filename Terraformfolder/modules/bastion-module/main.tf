resource "azurerm_public_ip" "public_ip" {
  for_each = var.bastions
  name                = each.value.public-ip-name
  location            = each.value.location
  resource_group_name = each.value.rg-name
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = each.value.tags
}


resource "azurerm_bastion_host" "bastion" {
    for_each = var.bastions
    name = each.value.bastion-name
    location = each.value.location
    resource_group_name = each.value.rg-name
    sku = each.value.sku
    tags = each.value.tags
    scale_units = 4
    ip_configuration {
        name = "bastion-ip-config"
        subnet_id = data.azurerm_subnet.example[each.key].id
        public_ip_address_id = azurerm_public_ip.public_ip[each.key].id
        
    }
  
}