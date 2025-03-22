resource "azurerm_resource_group" "rg" {
    for_each = var.rgs
    name     = each.value.rg-name
    location = each.value.location
    
    tags = {
        Environment        = each.value.environment
        Owner             = each.value.owner
        CostCenter        = each.value.cost_center
        Application       = each.value.application
        Department        = each.value.department
        Project           = each.value.project
        
    }
}
