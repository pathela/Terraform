variable "rg_name" {
   type = string
   description = "Resource Group Name"
}

variable "rg_location" {
   type = string 
   description = "Resource Group Location"
}

variable "acr_name" {
   type = string
}

variable "acr_sku" {
    type = string  
}

variable "aks_name" {
    type = string
}

variable "node_count" {
    type = number
}

variable "env" {
    type = string  
}