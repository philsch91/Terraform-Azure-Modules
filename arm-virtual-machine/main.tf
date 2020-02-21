resource "azurerm_virtual_machine" "main" {
    name        = var.VM_NAME
    vm_size     = var.VM_SIZE
    location    = var.VM_LOCATION

    resource_group_name     = var.RESOURCE_GROUP_NAME
    network_interface_ids   = var.NIC_ID_LIST
    
    delete_os_disk_on_termination       = var.DELETE_OS_DISK_ON_TERMINATION
    delete_data_disks_on_termination    = var.DELETE_DATA_DISKS_ON_TERMINATION

    os_profile {
        computer_name   = var.OS_PROFILE_COMPUTER_NAME
        admin_username  = var.OS_PROFILE_ADMIN_USERNAME
        admin_password  = var.OS_PROFILE_ADMIN_PASSWORD
    }

    dynamic "os_profile_linux_config" {
        for_each = lower(var.OS_TYPE) == "linux" ? ["1"] : []

        content {
            disable_password_authentication = var.DISABLE_PASSWORD_AUTH
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
        for_each = lower(var.OS_TYPE) == "windows" ? ["1"] : []

        content {
            provision_vm_agent          = true
            enable_automatic_upgrades   = false

            dynamic "additional_unattend_config" {
                for_each = var.AUTO_LOGON_USERNAME != null && var.AUTO_LOGON_PASSWORD != null ? ["1"] : []
        
                content {
                    #pass            = additional_unattend_config.value.pass
                    pass            = "oobeSystem"
                    component       = "Microsoft-Windows-Shell-Setup"
                    setting_name    = "AutoLogon"
                    content         = "<AutoLogon><Username>${var.AUTO_LOGON_USERNAME}</Username><Password><Value>${var.AUTO_LOGON_PASSWORD}</Value></Password><Enabled>true</Enabled><LogonCount>1</LogonCount></AutoLogon>"
                }
            }

            dynamic "additional_unattend_config" {
                for_each = var.ADDITIONAL_UNATTEND_CONFIG_LIST

                content {
                    pass            = var.UNATTEND_CONFIG_PASS
                    component       = var.UNATTEND_CONFIG_COMPONENT
                    setting_name    = var.UNATTEND_CONFIG_SETTING_NAME
                    content         = var.UNATTEND_CONFIG_CONTENT
                }
            }
        }
    }

    storage_image_reference {
        publisher   = var.STORAGE_IMAGE_PUBLISHER
        offer       = var.STORAGE_IMAGE_OFFER
        sku         = var.STORAGE_IMAGE_SKU
        version     = var.STORAGE_IMAGE_VERSION
    }

    storage_os_disk {
        name                = var.STORAGE_OS_DISK_NAME
        caching             = var.STORAGE_OS_DISK_CACHING
        create_option       = var.STORAGE_OS_DISK_CREATE_OPTION
        managed_disk_type   = var.STORAGE_OS_DISK_MANAGED_DISK_TYPE
    }

    # https://www.hashicorp.com/blog/hashicorp-terraform-0-12-preview-for-and-for-each/

    dynamic "storage_data_disk" {
        for_each = var.STORAGE_DATA_DISK_LIST

        content {
            name                = storage_data_disk.value.name
            caching             = storage_data_disk.value.caching
            managed_disk_type   = storage_data_disk.value.managed_disk_type
            create_option       = storage_data_disk.value.create_option
            disk_size_gb        = storage_data_disk.value.disk_size_gb
            lun                 = storage_data_disk.value.lun
        }
    }

    tags = {
        environment = "staging"
    }
}