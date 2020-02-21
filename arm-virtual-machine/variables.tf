#--------------------------------------------------------------
# Virtual machine input variables
#--------------------------------------------------------------
variable "RESOURCE_GROUP_NAME" {
    description = "The name of the already existing resource group e.g. data.azurerm_resource_group.rg_net_name.name"
    type        = string
}
variable "NIC_ID_LIST" {
    description = "The list with the IDs of the NICs"
    type        = list(string)
}
variable "VM_NAME" {
    description = "tbd"
    type        = string
}
variable "VM_SIZE" {
    description = "Azure virtual machine size e.g. Standard_DS1_v2"
    type        = string
}
variable "VM_LOCATION" {
    description = "tbd"
    type        = string
}
variable "DELETE_OS_DISK_ON_TERMINATION" {
    description = "tbd"
    type        = bool
    default     = true
}
variable "DELETE_DATA_DISKS_ON_TERMINATION" {
    description = "tbd"
    type        = bool
    default     = true
}

#OS_PROFILE

variable "OS_PROFILE_COMPUTER_NAME" {
    description = "tbd"
}
variable "OS_PROFILE_ADMIN_USERNAME" {
    description = "tbd"
}
variable "OS_PROFILE_ADMIN_PASSWORD" {
    description = "tbd"
}

#STORAGE_IMAGE

variable "STORAGE_IMAGE_PUBLISHER" {
    description = "MicrosoftWindowsServer or RedHat"
}
variable "STORAGE_IMAGE_OFFER" {
    description = "WindowsServer or RHEL"
}
variable "STORAGE_IMAGE_SKU" {
    description = "2016-Datacenter or 7-LVM"
}
variable "STORAGE_IMAGE_VERSION" {
    description = "latest"
    default = "latest"
}
variable "OS_TYPE" {
    description = "Linux or Windows"
    type        = string
    default     = "Linux"
}

#STORAGE_OS_DISK

variable "STORAGE_OS_DISK_NAME" {
    description = "tbd"
    type        = string
}
variable "STORAGE_OS_DISK_CACHING" {
    description = "tbd"
    type        = string
    default     = "ReadWrite"
}
variable "STORAGE_OS_DISK_CREATE_OPTION" {
    description = "tbd"
    type        = string
    default     = "FromImage"
}
variable "STORAGE_OS_DISK_MANAGED_DISK_TYPE" {
    description = "tbd"
    type        = string
    default     = "Standard_LRS"
}

#STORAGE_DATA_DISK

variable "STORAGE_DATA_DISK_LIST" {
    description = "list of storage data disks for the virtual machine"
    type = list(object({
        name                = string,
        caching             = string,
        managed_disk_type   = string,
        create_option       = string,
        disk_size_gb        = number,
        lun                 = number
    }))
    default = []
}

variable "DISABLE_PASSWORD_AUTH" {
    description = "tbd"
    type        = bool
    default     = false
}

#UNATTEND_CONFIG

variable "ADDITIONAL_UNATTEND_CONFIG_LIST" {
    description = "list of unattended configs for the virtual machine"
    type = list(object({
        pass            = string,
        component       = string,
        setting_name    = string,
        content         = string
    }))
    default = []
}

variable "UNATTEND_CONFIG_PASS" {
    description = "The pass e.g. oobeSystem"
    type        = string
    default     = null
}
variable "UNATTEND_CONFIG_COMPONENT" {
    description = "The component like Microsoft-Windows-Shell-Setup"
    type        = string
    default     = null
}
variable "UNATTEND_CONFIG_SETTING_NAME" {
    description = "The setting name e.g. AutoLogon"
    type        = string
    default     = null
}
variable "UNATTEND_CONFIG_CONTENT" {
    description = "The configuration content usually a xml value"
    type        = string
    default     = null
}

#UNATTEND_CONFIG_AUTO_LOGON

variable "AUTO_LOGON_USERNAME" {
    description = "tbd"
    type        = string
    default     = null
}
variable "AUTO_LOGON_PASSWORD" {
    description = "tbd"
    type        = string
    default     = null
}
