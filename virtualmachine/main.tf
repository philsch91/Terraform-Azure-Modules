resource "azurerm_virtual_machine" "main" {
    name        = var.ARM_VM_NAME
    vm_size     = var.ARM_VM_SIZE
    location    = var.ARM_VM_LOCATION

    resource_group_name     = var.ARM_RESOURCE_GROUP_NAME
    network_interface_ids   = var.ARM_NIC_ID_LIST
    
    delete_os_disk_on_termination       = var.ARM_DELETE_OS_DISK_ON_TERMINATION
    delete_data_disks_on_termination    = var.ARM_DELETE_DATA_DISKS_ON_TERMINATION

    os_profile {
        computer_name   = var.ARM_OS_PROFILE_COMPUTER_NAME
        admin_username  = var.ARM_OS_PROFILE_ADMIN_USERNAME
        admin_password  = var.ARM_OS_PROFILE_ADMIN_PASSWORD
    }

    dynamic "os_profile_linux_config" {
        for_each = lower(var.ARM_OS_TYPE) == "linux" ? ["1"] : []

        content {
            disable_password_authentication = var.disable_password_auth
            /*
            dynamic "ssh_keys" {
                for_each = data.azurerm_key_vault_secret.ssh_pubkeys_values.*.value
                content {
                    path     = "/home/fallback/.ssh/authorized_keys"
                    key_data = ssh_keys.value
                }
            } */
        }
    }

    dynamic "os_profile_windows_config" {
        for_each = lower(var.ARM_OS_TYPE) == "windows" ? ["1"] : []

        content {
            provision_vm_agent          = true
            enable_automatic_upgrades   = false
        }
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

    # https://www.hashicorp.com/blog/hashicorp-terraform-0-12-preview-for-and-for-each/

    dynamic "storage_data_disk" {
        for_each = var.ARM_STORAGE_DATA_DISK_LIST

        content {
            name                = storage_data_disk.name
            caching             = storage_data_disk.caching
            managed_disk_type   = storage_data_disk.managed_disk_type
            create_option       = storage_data_disk.create_option
            disk_size_gb        = storage_data_disk.disk_size_gb
            lun                 = storage_data_disk.lun
        }
    }

    tags = {
        environment = "staging"
    }
}