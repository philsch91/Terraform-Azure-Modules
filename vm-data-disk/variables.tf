#--------------------------------------------------------------
# VM data disk input variables
#--------------------------------------------------------------
variable "ARM_RESOURCE_GROUP_NAME" {
    description = "The name of the already existing resource group e.g. data.azurerm_resource_group.rg_net_name.name"
    type        = string
}
variable "ARM_RESOURCE_GROUP_LOCATION" {
    description = "The location of the resource group"
    type        = string
}
variable "ARM_VIRTUAL_MACHINE_ID" {
    description = "The id of the existing virtual machine in the resource group e.g. azurerm_virtual_machine.example.id"
    type        = string
}
variable "ARM_DATA_DISK_NAME" {
    description = "The name of the disk"
    type        = string
}
variable "ARM_DATA_DISK_CACHING" {
    description = "None, ReadOnly or ReadWrite"
    type        = string
}
variable "ARM_DATA_DISK_CREATE_OPTION" {
    description = "Atach, FromImage or Empty"
    type        = string
}
variable "ARM_DATA_DISK_SIZE_GB" {
    description = "Size of the disk in gigabytes"
    type        = number
}
variable "ARM_DATA_DISK_LUN" {
    description = "Logical unit number"
    type        = number
}
variable "ARM_DATA_MANAGED_DISK_TYPE" {
    description = "Type of the managed disk. Either Standard_LRS, StandardSSD_LRS, Premium_LRS or UltraSSD_LRS"
    type        = string
    default     = "Standard_LRS"
}