resource "azurerm_virtual_machine" "main" {
    name        = var.ARM_VM_NAME
    vm_size     = var.ARM_VM_SIZE
    location    = var.ARM_VM_LOCATION

    resource_group_name = data.azurerm_resource_group.rg_net_name.name
  
    network_interface_ids = [azurerm_network_interface.main.id]
    
    delete_os_disk_on_termination       = var.DELETE_OS_DISK_ON_TERMINATION
    delete_data_disks_on_termination    = var.DELETE_DATA_DISKS_ON_TERMINATION

    os_profile {
        computer_name   = var.ARM_OS_PROFILE_COMPUTER_NAME
        admin_username  = var.ARM_OS_PROFILE_ADMIN_USERNAME
        admin_password  = var.ARM_OS_PROFILE_ADMIN_PASSWORD
    }

    os_profile_linux_config {
        disable_password_authentication = false
    }

    os_profile_windows_config {
        provision_vm_agent          = true
        enable_automatic_upgrades   = false
    }

    storage_image_reference {
        publisher   = var.ARM_STORAGE_IMAGE_PUBLISHER
        offer       = var.ARM_STORAGE_IMAGE_OFFER
        sku         = var.ARM_STORAGE_IMAGE_SKU
        version     = var.ARM_STORAGE_IMAGE_VERSION
    }

    storage_os_disk {
        name                = var.ARM_STORAGE_OS_DISK_NAME
        caching             = var.ARM_STORAGE_OS_DISK_CACHING
        create_option       = var.ARM_STORAGE_OS_DISK_CREATE_OPTION
        managed_disk_type   = var.ARM_STORAGE_OS_DISK_MANAGED_DISK_TYPE
    }

    storage_data_disk {
        name                = var.ARM_SQLSRV01_DATADISK_NAME
        caching             = "ReadWrite"
        managed_disk_type   = "Standard_LRS"
        create_option       = "Empty"
        disk_size_gb        = var.ARM_SQLSRV_DATADISK_SIZE
        lun                 = 1 
    }
  
    storage_data_disk {
        name                = var.ARM_SQLSRV01_LOGDISK_NAME
        caching             = "ReadWrite"
        managed_disk_type   = "Standard_LRS"
        create_option       = "Empty"
        disk_size_gb        = var.ARM_SQLSRV_LOGDISK_SIZE
        lun                 = 2
    }
  
    storage_data_disk {
        name = var.ARM_SQLSRV01_BACKUPDISK_NAME
        caching           = "ReadWrite"
        managed_disk_type = "Standard_LRS"
        create_option     = "Empty"
        disk_size_gb      = var.ARM_SQLSRV_BACKUPDISK_SIZE
        lun               = 3
    }

    tags = {
        environment = "staging"
    }
}