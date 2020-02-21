#--------------------------------------------------------------
# Network interface input variables
#--------------------------------------------------------------
variable "RESOURCE_GROUP_NAME" {
    description = "The name of the already existing resource group e.g. data.azurerm_resource_group.rg_net_name.name"
    type        = string
}
variable "SUBNET_ID" {
    description = "The id of the existing subnet e.g. data.azurerm_subnet.main.id"
    type        = string
}
variable "NIC_NAME" {
    description = "The name of the NIC"
    type        = string
}
variable "NIC_LOCATION" {
    description = "The name of the location for the NIC"
    type        = string
}
variable "NIC_IP_CONFIGURATION_NAME" {
    description = "The name of the specific NIC configuration"
    type        = string
}
variable "NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION" {
    description = "Dynamic or Static"
    type        = string
    default     = "Dynamic"
}

# https://www.hashicorp.com/blog/terraform-0-12-conditional-operator-improvements/

variable "NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS" {
    description = "Optional IP address if the allocation is set to Static"
    type        = string
    default     = null
}