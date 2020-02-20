# Virtual Machine

### Usage

```terraform
data "azurerm_resource_group" "main" {
    name = var.ARM_RESOURCE_GROUP_NAME
}

data "azurerm_subnet" "internal" {
  name                 = var.ARM_SUBNET_NAME
  virtual_network_name = var.ARM_VIRTUAL_NETWORK_NAME
  resource_group_name  = var.ARM_RESOURCE_GROUP_NAME
}

data "azurerm_network_interface" "main-image-nic" {
    name                = var.ARM_IMGSRV_NETWORK_INTERFACE_NAME
    #location            = var.ARM_IMGSRV_NETWORK_INTERFACE_LOCATION
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.nic
    ]
}

module "virtualmachine" {
    source = "git::https://server/path/to/repo.git//virtualmachine"

    # required parameters
    ARM_RESOURCE_GROUP_NAME = data.azurerm_resource_group.main.name
    ARM_NIC_ID_LIST         = [data.azurerm_network_interface.main-image-nic.id]
    ARM_VM_NAME             = var.ARM_IMGSRV_NAME
    ARM_VM_SIZE             = var.ARM_IMGSRV_VM_SIZE
    ARM_VM_LOCATION         = var.ARM_LOCATION

    ARM_OS_PROFILE_COMPUTER_NAME    = var.ARM_IMGSRV_OS_PROFILE_COMPUTER_NAME
    ARM_OS_PROFILE_ADMIN_USERNAME   = var.ARM_IMGSRV_OS_PROFILE_ADMIN_USERNAME
    ARM_OS_PROFILE_ADMIN_PASSWORD   = var.ARM_IMGSRV_OS_PROFILE_ADMIN_PASSWORD

    ARM_STORAGE_IMAGE_PUBLISHER = var.ARM_IMGSRV_PUBLISHER
    ARM_STORAGE_IMAGE_OFFER     = var.ARM_IMGSRV_OFFER
    ARM_STORAGE_IMAGE_SKU       = var.ARM_IMGSRV_SKU
    ARM_STORAGE_IMAGE_VERSION   = var.ARM_IMGSRV_VERSION

    ARM_STORAGE_OS_DISK_NAME                = var.ARM_IMGSRV_STORAGE_OS_DISK_NAME

    # optional parameters
    ARM_DELETE_OS_DISK_ON_TERMINATION       = false
    ARM_DELETE_DATA_DISKS_ON_TERMINATION    = false

    ARM_OS_TYPE = "Linux"

    ARM_STORAGE_OS_DISK_CACHING             = "ReadWrite"
    ARM_STORAGE_OS_DISK_CREATE_OPTION       = "FromImage"
    ARM_STORAGE_OS_DISK_MANAGED_DISK_TYPE   = var.ARM_IMGSRV_STORAGE_OS_DISK_MANAGED_DISK_TYPE

    #ARM_STORAGE_DATA_DISK_LIST              = []
}
```