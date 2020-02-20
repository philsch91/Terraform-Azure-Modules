resource "azurerm_managed_disk" "main" {
    name                    = var.ARM_DATA_DISK_NAME
    resource_group_name     = var.ARM_RESOURCE_GROUP_NAME
    location                = var.ARM_RESOURCE_GROUP_LOCATION
    storage_account_type    = var.ARM_DATA_MANAGED_DISK_TYPE
    create_option           = var.ARM_DATA_DISK_CREATE_OPTION
    disk_size_gb            = var.ARM_DATA_DISK_SIZE_GB
}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
    managed_disk_id    = azurerm_managed_disk.main.id
    virtual_machine_id = var.ARM_VIRTUAL_MACHINE_ID
    lun                = var.ARM_DATA_DISK_LUN
    caching            = var.ARM_DATA_DISK_CACHING
}