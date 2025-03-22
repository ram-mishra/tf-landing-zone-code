variable "vms" {
    description = "A map of VMs to create"
    type = map(object({
        vm-name = string
        nic-name = string
        subnet-name = string
        vnet-name = string
        rg-name = string
        location = string
        vm-size = string
        admin_username = string
        admin_password = string
        os_disk = object({
        disk_size_gb = number
        storage_account_type = string
        
        })
        source_image_reference = object({
        publisher = string
        offer = string
        sku = string
        version = string
        })
        
    }))
    }
