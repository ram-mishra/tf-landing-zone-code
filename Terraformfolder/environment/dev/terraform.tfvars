rg-groups = {
  dev-rg1 = {
    rg-name     = "dev-rgmishra1"
    location    = "eastus"
    environment = "dev"
    owner       = "admin"
    cost_center = "it"
    application = "app"
    department  = "it"
    project     = "project"
  }
  dev-rg2 = {
    rg-name     = "devaksrgmishra2"
    location    = "West Europe"
    environment = "dev"
    owner       = "admin"
    cost_center = "it"
    application = "app"
    department  = "it"
    project     = "project"
  }
  dev-rg3 = {
    rg-name     = "devrgmishra3"
    location    = "West Europe"
    environment = "dev"
    owner       = "admin"
    cost_center = "it"
    application = "app"
    department  = "it"
    project     = "project"
  }
}

vnet-groups = {
  devvnetnew = {
    vnet-name     = "dev-vnet11"
    location      = "eastus"
    rg-name       = "dev-rg"
    address_space = ["10.0.0.0/16"]

    subnets = [
      {
        name             = "subnet11"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "subnet21"
        address_prefixes = ["10.0.2.0/24"]
      },
      {
        name             = "subnet31"
        address_prefixes = ["10.0.3.0/24"]
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.4.0/24"]
      }
  ] }
}


vm-groups = {
  devvm1 = {
    vm-name        = "vm11"
    location       = "eastus"
    vnet-name      = "dev-vnet11"
    nic-name       = "nic1"
    subnet-name    = "subnet1"
    vm-size        = "Standard_DS1_v2"
    admin_username = "rammishra"
    admin_password = "rammishra@123456"
    nic-name       = "nic1"
    rg-name        = "dev-rg"
    subnetd-id     = "dev-vnet11"

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    os_disk = {
      name                 = "osdisk1"
      caching              = "ReadWrite"
      disk_size_gb         = 30
      storage_account_type = "Standard_LRS"
    }
  }
  devvm2 = {
    vm-name        = "vm21"
    location       = "eastus"
    vnet-name      = "dev-vnet11"
    nic-name       = "nic2"
    subnet-name    = "subnet2"
    vm-size        = "Standard_DS1_v2"
    admin_username = "rammishra"
    admin_password = "rammishra@123456"
    nic-name       = "nic2"
    rg-name        = "dev-rg"
    subnetd-id     = "dev-vnet11"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    os_disk = {
      name                 = "osdisk2"
      caching              = "ReadWrite"
      disk_size_gb         = 30
      storage_account_type = "Standard_LRS"
    }
  }
}

bastion-groups = {
  devbastion = {
    bastion-name   = "dev-bastion"
    location       = "eastus"
    rg-name        = "dev-rg"
    vnet-name      = "dev-vnet11"
    public-ip-name = "dev-bastion-ip"
    sku            = "Standard"
    tags = {
      environment = "dev"
      owner       = "admin"
      cost_center = "it"
      application = "app"
      department  = "it"
      project     = "project"
    }
  }
}

// akscluster-groups = {
//   "devaks" = {
//     name               = "devaks"
//     location           = "south india"
//     rg-name            = "devaksrg"
//     dns_prefix         = "devaks"
//     kubernetes_version = "1.29.2"

//     default_node_pool = [
//       {
//         name            = "default"
//         node_count      = 2
//         vm_size         = "Standard_DS2_v2"
//         os_disk_size_gb = 30

//       }
//     ]

//   }



// }




// storage-groups = {
//   devstg = {
//     stg_name                 = "devstg"
//     resource_group_name      = "dev-rg"
//     location                 = "eastus"
//     account_tier             = "Standard"
//     account_replication_type = "LRS"
//     account_kind             = "StorageV2"
//     tags = {
//       environment = "dev"
//       owner       = "admin"
//       cost_center = "it"
//       application = "app"
//       department  = "it"
//       project     = "project"
//     }

//   }
// }