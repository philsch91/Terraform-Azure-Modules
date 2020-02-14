#--------------------------------------------------------------
# Virtual machine input variables
#--------------------------------------------------------------
variable "ARM_VM_NAME" {
    description = "tbd"
    type        = string
}
variable "ARM_VM_SIZE" {
    description = "tbd"
    type        = number
}

variable "ARM_VM_LOCATION" {
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

variable "ARM_OS_PROFILE_COMPUTER_NAME" {
    description = "tbd"
}
variable "ARM_OS_PROFILE_ADMIN_USERNAME" {
    description = "tbd"
}
variable "ARM_OS_PROFILE_ADMIN_PASSWORD" {
    description = "tbd"
}

#STORAGE_IMAGE_REFERENCE

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

#STORAGE_OS_DISK

variable "ARM_STORAGE_OS_DISK_NAME" {
    description = "tbd"
}
variable "ARM_STORAGE_OS_DISK_CACHING" {
    description = "tbd"
    default = "ReadWrite"
}
variable "ARM_STORAGE_OS_DISK_CREATE_OPTION" {
    description = "tbd"
    default = "FromImage"
}
variable "ARM_STORAGE_OS_DISK_MANAGED_DISK_TYPE" {
    description = "tbd"
    default = "Standard_LRS"
}


variable "ARM_SQLSRV01_DATADISK_NAME" {
    description = ""
    default ="SQLSRV01_Data"
}
variable "ARM_SQLSRV01_LOGDISK_NAME" {
    description = ""
    default = "SQLSRV01_LOG"
}
variable "ARM_SQLSRV01_BACKUPDISK_NAME" {
    description = ""
    default = "SQLSRV01_BACKUP"
}