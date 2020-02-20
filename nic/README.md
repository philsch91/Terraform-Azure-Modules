# Network Interface

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

module "nic" {
    source = "git::https://server/path/to/repo.git//nic"

    # required parameters
    ARM_RESOURCE_GROUP_NAME = data.azurerm_resource_group.main.name
    ARM_SUBNET_ID           = data.azurerm_subnet.internal.id

    ARM_NIC_NAME            = var.ARM_IMGSRV_NETWORK_INTERFACE_NAME
    ARM_NIC_LOCATION        = var.ARM_IMGSRV_NETWORK_INTERFACE_LOCATION

    ARM_NIC_IP_CONFIGURATION_NAME                           = var.ARM_IMGSRV_NETWORK_INTERFACE_IP_CONFIGURATION_NAME
    ARM_NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION  = var.ARM_IMGSRV_NETWORK_INTERFACE_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION
}
```