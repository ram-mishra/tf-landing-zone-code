variable "vnets" {                          # variable block
    description = "A map of virtual networks"  # description of the variable
    type = map(object({                     # map of objects
        vnet-name = string
        location = string
        rg-name = string
        address_space = list(string)        # address space list of strings for the virtual network
        subnets = list(object({               # subnets list of objects for the subnet block
            name = string
            address_prefixes = list(string)
        }))
    }))
}