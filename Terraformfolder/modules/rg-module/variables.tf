variable "rgs" {
    type = map(object({
        rg-name = string
        location = string
        environment = string
        owner = string
        cost_center = string
        application = string
        department = string
        project = string
        
    }))
}