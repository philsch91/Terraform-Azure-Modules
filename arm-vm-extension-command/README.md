# Azure Virtual Machine Extension Command

### Usage

```terraform
data "azurerm_resource_group" "main" {
    name = var.RESOURCE_GROUP_NAME
}

data "azurerm_virtual_machine" "vm" {
    name                = var.VM_NAME
    #location            = var.IMGSRV_NETWORK_INTERFACE_LOCATION
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.virtual-machine
    ]
}

module "vm-extension-command" {
    source = "git::https://server/path/to/repo.git//arm-vm-extension-command"

    # required parameters
    VM_EXTENSION_NAME       = var.EXTENSION_NAME
    LOCATION_NAME           = var.LOCATION
    RESOURCE_GROUP_NAME     = data.azurerm_resource_group.main.name
    VM_NAME                 = data.azurerm_virtual_machine.vm.name
    # VM_ID                   = data.azurerm_virtual_machine.vm.id

    VM_EXTENSION_COMMAND = "hostname && uptime"

    # optional parameters
    # none
}
```

