# Azure Virtual Machine Extension

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

module "vm-extension" {
    source = "git::https://server/path/to/repo.git//arm-vm-extension"

    # required parameters
    VM_EXTENSION_NAME       = var.EXTENSION_NAME
    LOCATION_NAME           = var.LOCATION
    RESOURCE_GROUP_NAME     = data.azurerm_resource_group.main.name
    VM_NAME                 = data.azurerm_virtual_machine.vm.name
    # VM_ID                   = data.azurerm_virtual_machine.vm.id
    
    VM_EXTENSION_PUBLISHER              = var.EXTENSION_PUBLISHER
    VM_EXTENSION_TYPE                   = var.EXTENSION_TYPE
    VM_EXTENSION_TYPE_HANDLER_VERSION   = var.EXTENSION_TYPE_HANDLER_VERSION

    # conditional parameters
    VM_EXTENSION_SETTINGS           = {commandToExecute = "hostname && uptime"}
    VM_EXTENSION_PROTECTED_SETTINGS = {Password = "password"}

    # optional parameters
    # none
}
```

```terraform
data "azurerm_resource_group" "main" {
    name = var.RESOURCE_GROUP_NAME
}

data "azurerm_virtual_machine" "vm" {
    name                = var.IMGSRV_NETWORK_INTERFACE_NAME
    #location            = var.IMGSRV_NETWORK_INTERFACE_LOCATION
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.virtual-machine
    ]
}

module "vm-extension" {
    source = "git::https://server/path/to/repo.git//arm-vm-extension"

    # required parameters
    VM_EXTENSION_NAME       = var.EXTENSION_NAME
    LOCATION_NAME           = var.LOCATION
    RESOURCE_GROUP_NAME     = data.azurerm_resource_group.main.name
    VM_NAME                 = data.azurerm_virtual_machine.vm.name
    # VM_ID                   = data.azurerm_virtual_machine.vm.id
    
    VM_EXTENSION_PUBLISHER              = "Microsoft.Compute"
    VM_EXTENSION_TYPE                   = "JsonADDomainExtension"
    VM_EXTENSION_TYPE_HANDLER_VERSION   = "1.3"

    VM_EXTENSION_SETTINGS = {
        name    = "domain.company.com"
        OUPath  = "OU=Azure,OU=Test,DC=domain,DC=company,DC=com"
        User    = "domain\\user"
        Restart = true
        Options = "3"
    }
    
    VM_EXTENSION_PROTECTED_SETTINGS = {
        Password = "Pa$$w0rd"
    }

    # optional parameters
    # none
}
```

