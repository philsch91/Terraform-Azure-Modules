# Virtual Machine Extension

### Usage

```terraform
data "azurerm_resource_group" "main" {
    name = var.ARM_RESOURCE_GROUP_NAME
}

data "azurerm_virtual_machine" "vm" {
    name                = var.ARM_IMGSRV_NETWORK_INTERFACE_NAME
    #location            = var.ARM_IMGSRV_NETWORK_INTERFACE_LOCATION
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.virtualmachine
    ]
}

module "vm-extension" {
    source = "git::https://server/path/to/repo.git//vm-extension"

    # required parameters
    VM_EXTENSION_NAME       = var.EXTENSION_NAME
    VM_ID                   = data.azurerm_virtual_machine.vm.id
    
    VM_EXTENSION_PUBLISHER              = var.EXTENSION_PUBLISHER
    VM_EXTENSION_TYPE                   = var.EXTENSION_TYPE
    VM_EXTENSION_TYPE_HANDLER_VERSION   = var.EXTENSION_TYPE_HANDLER_VERSION

    # conditional parameters
    VM_EXTENSION_SETTINGS           = {"commandToExecute"="hostname && uptime"}
    VM_EXTENSION_PROTECTED_SETTINGS = {"Password"="password"}

    # optional parameters
    # none
    
    # deprecated parameters
    #RESOURCE_GROUP_NAME     = data.azurerm_resource_group.main.name
}
```

