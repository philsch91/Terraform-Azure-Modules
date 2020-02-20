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
variable "VM_EXTENSION_PUBLISHER" {
    description = "The resource ID of the virtual machine e.g. Microsoft.Azure.Extensions or Microsoft.Compute"
    type        = string
}
variable "VM_EXTENSION_TYPE" {
    description = "The type of extension e.g. CustomScript or JsonADDomainExtension. Available types for a publisher can be found using the Azure CLI"
    type        = string
}
variable "VM_EXTENSION_TYPE_HANDLER_VERSION" {
    description = "Specifies the version of the extension to use e.g 2.0 or 1.3. Available versions can be found using the Azure CLI"
    type        = string
}
variable "VM_EXTENSION_SETTINGS" {
    description = "The settings passed to the extension, these are specified as a JSON object in a string"
    #type        = string
}
variable "VM_EXTENSION_PROTECTED_SETTINGS" {
    description = "The settings passed to the extension, these are specified as a JSON object in a string"
    #type        = string
}