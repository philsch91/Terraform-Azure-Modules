#--------------------------------------------------------------
# Virtual machine input variables
#--------------------------------------------------------------
variable "ARM_RESOURCE_GROUP_NAME" {
    description = "The name of the already existing resource group e.g. data.azurerm_resource_group.rg_net_name.name"
    type        = string
}
variable "ARM_NIC_ID_LIST" {
    description = "The list with the IDs of the NICs"
    type        = list(string)
}
variable "ARM_VM_NAME" {
    description = "tbd"
    type        = string
}
variable "ARM_VM_SIZE" {
    description = "Azure virtual machine size e.g. Standard_DS1_v2"
    type        = string
}
variable "ARM_VM_LOCATION" {
    description = "tbd"
    type        = string
}
variable "ARM_DELETE_OS_DISK_ON_TERMINATION" {
    description = "tbd"
    type        = bool
    default     = true
}
variable "ARM_DELETE_DATA_DISKS_ON_TERMINATION" {
    description = "tbd"
    type        = bool
    default     = true
}

#OS_PROFILE

variable "ARM_OS_PROFILE_COMPUTER_NAME" {
    description = "tbd"
}
variable "ARM_OS_PROFILE_ADMIN_USERNAME" {
    description = "tbd"
}
variable "ARM_OS_PROFILE_ADMIN_PASSWORD" {
    description = "tbd"
}

#STORAGE_IMAGE

variable "ARM_STORAGE_IMAGE_PUBLISHER" {
    description = "MicrosoftWindowsServer or RedHat"
}
variable "ARM_STORAGE_IMAGE_OFFER" {
    description = "WindowsServer or RHEL"
}
variable "ARM_STORAGE_IMAGE_SKU" {
    description = "2016-Datacenter or 7-LVM"
}
variable "ARM_STORAGE_IMAGE_VERSION" {
    description = "latest"
    default = "latest"
}
variable "ARM_OS_TYPE" {
    description = "Linux or Windows"
    type        = string
    default     = "Linux"
}

#STORAGE_OS_DISK

variable "ARM_STORAGE_OS_DISK_NAME" {
    description = "tbd"
    type        = string
}
variable "ARM_STORAGE_OS_DISK_CACHING" {
    description = "tbd"
    type        = string
    default     = "ReadWrite"
}
variable "ARM_STORAGE_OS_DISK_CREATE_OPTION" {
    description = "tbd"
    type        = string
    default     = "FromImage"
}
variable "ARM_STORAGE_OS_DISK_MANAGED_DISK_TYPE" {
    description = "tbd"
    type        = string
    default     = "Standard_LRS"
}

#STORAGE_DATA_DISK

variable "ARM_STORAGE_DATA_DISK_LIST" {
    description = "list of storage data disks for the virtual machine"
    type = list(object({
        name                = string
        caching             = string
        managed_disk_type   = string
        create_option       = string
        disk_size_gb        = number
        lun                 = number
    }))
    default = []
}

variable "ARM_DISABLE_PASSWORD_AUTH" {
    description = "tbd"
    type        = bool
    default     = false
}
