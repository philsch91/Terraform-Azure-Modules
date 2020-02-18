resource "azurerm_network_interface" "main" {
    name                = var.ARM_NIC_NAME
    location            = var.ARM_NIC_LOCATION
    resource_group_name = var.ARM_RESOURCE_GROUP_NAME

    ip_configuration {
        name                          = var.ARM_NIC_IP_CONFIGURATION_NAME
        subnet_id                     = var.ARM_SUBNET_ID
        private_ip_address_allocation = var.ARM_NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION
        private_ip_address            = var.ARM_NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS
    }
}