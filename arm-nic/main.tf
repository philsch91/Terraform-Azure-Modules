resource "azurerm_network_interface" "main" {
    name                = var.NIC_NAME
    location            = var.NIC_LOCATION
    resource_group_name = var.RESOURCE_GROUP_NAME

    ip_configuration {
        name                          = var.NIC_IP_CONFIGURATION_NAME
        subnet_id                     = var.SUBNET_ID
        private_ip_address_allocation = var.NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS_ALLOCATION
        private_ip_address            = var.NIC_IP_CONFIGURATION_PRIVATE_IP_ADDRESS
    }
}