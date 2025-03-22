variable "akscluster" {
    type = map(object({
        name                = string
        location            = string
        rg-name             = string
        dns_prefix          = string
        kubernetes_version  = string
        default_node_pool   = list(object({
            name            = string
            node_count      = number
            vm_size         = string
            os_disk_size_gb = number
            type            = string
        }))
    }))
}