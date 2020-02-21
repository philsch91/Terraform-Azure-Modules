resource "azurerm_managed_disk" "main" {
    name                    = var.DATA_DISK_NAME
    resource_group_name     = var.RESOURCE_GROUP_NAME
    location                = var.RESOURCE_GROUP_LOCATION
    storage_account_type    = var.DATA_MANAGED_DISK_TYPE
    create_option           = var.DATA_DISK_CREATE_OPTION
    disk_size_gb            = var.DATA_DISK_SIZE_GB
}

resource "azurerm_virtual_machine_data_disk_attachment" "main" {
    managed_disk_id    = azurerm_managed_disk.main.id
    virtual_machine_id = var.VIRTUAL_MACHINE_ID
    lun                = var.DATA_DISK_LUN
    caching            = var.DATA_DISK_CACHING
}