
resource "azurerm_network_interface" "nic" {
  for_each = var.vms
  name                = each.value.nic-name
  location            = each.value.location
  resource_group_name = each.value.rg-name

  ip_configuration {
    name                          = "MyNicConfiguration"
    subnet_id                     = data.azurerm_subnet.example[each.key].id
    private_ip_address_allocation = "Dynamic"
    
}
}

resource "azurerm_linux_virtual_machine" "vm" {
    for_each = var.vms
    name = each.value.vm-name
    resource_group_name = each.value.rg-name
    location = each.value.location
    size = each.value.vm-size
    admin_username = each.value.admin_username
    admin_password = each.value.admin_password
    network_interface_ids = [azurerm_network_interface.nic[each.key].id]
    disable_password_authentication = false
    os_disk {
        caching = "ReadWrite"
        disk_size_gb = each.value.os_disk.disk_size_gb
        storage_account_type = each.value.os_disk.storage_account_type
    }
    source_image_reference {
        publisher = each.value.source_image_reference.publisher
        offer = each.value.source_image_reference.offer
        sku = each.value.source_image_reference.sku
        version = each.value.source_image_reference.version
    }

  
}