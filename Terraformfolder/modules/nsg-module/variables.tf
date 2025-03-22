variable "nsgs" {
    description = "A map of NSGs to create"
    type = map(object({
        nsg-name = string
        security_rules = list(object({
            name = string
            priority = number
            direction = string
            access = string
            protocol = string
            source_port_range = string
            destination_port_range = string
            source_address_prefix = string
            destination_address_prefix = string
        }))
    }))
    }
    