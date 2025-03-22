variable "bastions" {                          # variable block
    description = "A map of bastion hosts"  # description of the variable
    type = map(object({                     # map of objects
        bastion-name = string
        location = string
        rg-name = string
        vnet-name = string
        public-ip-name = string
        sku = string
        tags = map(string)
    }))
  
}