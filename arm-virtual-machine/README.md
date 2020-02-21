# Azure Virtual Machine

### Usage

```terraform
data "azurerm_resource_group" "main" {
    name = var.RESOURCE_GROUP_NAME
}

data "azurerm_subnet" "internal" {
  name                 = var.SUBNET_NAME
  virtual_network_name = var.VIRTUAL_NETWORK_NAME
  resource_group_name  = var.RESOURCE_GROUP_NAME
}

data "azurerm_network_interface" "main-image-nic" {
    name                = var.VM_NETWORK_INTERFACE_NAME
    #location            = var.IMGSRV_NETWORK_INTERFACE_LOCATION
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.nic
    ]
}

module "virtualmachine" {
    source = "git::https://server/path/to/repo.git//arm-virtual-machine"

    # required parameters
    RESOURCE_GROUP_NAME = data.azurerm_resource_group.main.name
    NIC_ID_LIST         = [data.azurerm_network_interface.main-image-nic.id]
    VM_NAME             = var.VM_NAME
    VM_SIZE             = var.VM_SIZE
    VM_LOCATION         = var.LOCATION

    OS_PROFILE_COMPUTER_NAME    = var.VM_OS_PROFILE_COMPUTER_NAME
    OS_PROFILE_ADMIN_USERNAME   = var.VM_OS_PROFILE_ADMIN_USERNAME
    OS_PROFILE_ADMIN_PASSWORD   = var.VM_OS_PROFILE_ADMIN_PASSWORD

    STORAGE_IMAGE_PUBLISHER = var.VM_PUBLISHER
    STORAGE_IMAGE_OFFER     = var.VM_OFFER
    STORAGE_IMAGE_SKU       = var.VM_SKU
    STORAGE_IMAGE_VERSION   = var.VM_VERSION

    STORAGE_OS_DISK_NAME                = var.VM_STORAGE_OS_DISK_NAME

    # optional parameters
    DELETE_OS_DISK_ON_TERMINATION       = false
    DELETE_DATA_DISKS_ON_TERMINATION    = false

    OS_TYPE = "Linux"

    STORAGE_OS_DISK_CACHING             = "ReadWrite"
    STORAGE_OS_DISK_CREATE_OPTION       = "FromImage"
    STORAGE_OS_DISK_MANAGED_DISK_TYPE   = var.VM_STORAGE_OS_DISK_MANAGED_DISK_TYPE

    STORAGE_DATA_DISK_LIST              = [
        {
            name                = var.DATADISK_NAME
            caching             = "ReadWrite"
            managed_disk_type   = "Standard_LRS"
            create_option       = "Empty"
            disk_size_gb        = var.DATADISK_SIZE
            lun                 = 1
        }
    ]

    UNATTEND_CONFIG_PASS
    UNATTEND_CONFIG_COMPONENT
    UNATTEND_CONFIG_SETTING_NAME
    UNATTEND_CONFIG_CONTENT

    AUTO_LOGON_USERNAME = "DOMAIN\\USERNAME"
    AUTO_LOGON_PASSWORD = "Pa55w0rd"
}
```