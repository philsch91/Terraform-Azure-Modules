# Azure Network Interface

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

module "nic" {
    source = "git::https://server/path/to/repo.git//arm-nic"

    # required parameters
    RESOURCE_GROUP_NAME = data.azurerm_resource_group.main.name
    SUBNET_ID           = data.azurerm_subnet.internal.id

    NIC_NAME            = var.VM_NETWORK_INTERFACE_NAME
    NIC_LOCATION        = var.VM_NETWORK_INTERFACE_LOCATION

    NIC_IP_CONFIGURATION_NAME                           = var.VM_NETWORK_INTERFACE_IP_CONFIGURATION_NAME
    NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION  = var.VM_NETWORK_INTERFACE_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION
}
```