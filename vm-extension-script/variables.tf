#--------------------------------------------------------------
# VM extension input variables
#--------------------------------------------------------------
variable "RESOURCE_GROUP_NAME" {
    description = "Deprecated"
    type        = string
    default     = null
}
variable "LOCATION_NAME" {
    description = "Deprecated"
    type        = string
    default     = null
}
variable "VM_EXTENSION_NAME" {
    description = "The name of the virtual machine extension peering. Changing this forces a new resource to be created."
    type        = string
}
variable "VM_NAME" {
    description = "Deprecated"
    type        = string
    default     = null
}
variable "VM_ID" {
    description = "The resource ID of the virtual machine e.g. data.azurerm_virtual_machine.example.id"
    type        = string
}
variable "VM_EXTENSION_SCRIPT" {
    description = "The script that is executed"
    type        = string
}