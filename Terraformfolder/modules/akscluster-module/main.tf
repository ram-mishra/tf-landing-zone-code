resource "azurerm_kubernetes_cluster" "akscluster" {
  for_each            = var.akscluster
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg-name
  dns_prefix          = each.value.dns_prefix
  kubernetes_version  = each.value.kubernetes_version

  default_node_pool {
    name                = each.value.default_node_pool[0].name
    node_count          = each.value.default_node_pool[0].node_count
    vm_size             = each.value.default_node_pool[0].vm_size
    os_disk_size_gb     = each.value.default_node_pool[0].os_disk_size_gb
    type                = each.value.default_node_pool[0].type
    max_pods            = 110
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "development"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "frontend" {
  for_each              = var.akscluster

  name                  = each.value.frontend-name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.akscluster[each.key].id
  node_count            = each.value.frontend-node_count
  vm_size               = each.value.frontend-vm_size
  os_disk_size_gb       = each.value.frontend-os_disk_size_gb
  mode                  = "User"
  min_count             = 1
  max_count             = 2
  
}
resource "azurerm_kubernetes_cluster_node_pool" "backend" {
  for_each              = var.akscluster

  name                  = "backend"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.akscluster[each.key].id
  node_count            = 1
  vm_size               = "Standard_DS2_v2"
  os_disk_size_gb       = 30
  mode                  = "User"
  min_count             = 1
  max_count             = 2
}
