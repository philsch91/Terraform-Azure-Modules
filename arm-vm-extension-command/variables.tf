#--------------------------------------------------------------
# VM extension input variables
#--------------------------------------------------------------
variable "VM_EXTENSION_NAME" {
    description = "The name of the virtual machine extension peering. Changing this forces a new resource to be created."
    type        = string
}
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
variable "VM_NAME" {
    description = "Deprecated"
    type        = string
    default     = null
}
variable "VM_ID" {
    description = "The resource ID of the virtual machine e.g. data.azurerm_virtual_machine.example.id"
    type        = string
    default     = null
}
variable "VM_EXTENSION_COMMAND" {
    description = "The command that is executed"
    type        = string
}