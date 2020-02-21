resource "azurerm_virtual_machine_extension" "main" {
    name                = var.VM_EXTENSION_NAME
    location            = var.LOCATION_NAME
    resource_group_name = var.RESOURCE_GROUP_NAME
    
    virtual_machine_id      = var.VM_ID 
    #virtual_machine_name    = var.VM_NAME
    
    publisher            = var.VM_EXTENSION_PUBLISHER
    type                 = var.VM_EXTENSION_TYPE
    type_handler_version = var.VM_EXTENSION_TYPE_HANDLER_VERSION
    
    /*
    settings = <<SETTINGS
    {
        "commandToExecute": "hostname && uptime"
    }
    SETTINGS

    settings = <<SETTINGS
    {
        "Name": "pixelrobots.co.uk",
        "OUPath": "OU=Servers,DC=pixelrobots,DC=co,DC=uk",
        "User": "pixelrobots.co.uk\\pr_admin",
        "Restart": "true",
        "Options": "3"
    }
    SETTINGS */

    #settings = format("<<SETTINGS %s SETTINGS",jsonencode(var.VM_EXTENSION_SETTINGS))
    settings = jsonencode(var.VM_EXTENSION_SETTINGS)
    /*
    protected_settings = <<PROTECTED_SETTINGS
    {
        "Password": "${var.admin_password}"
    }
    PROTECTED_SETTINGS */

    #protected_settings = format("<<PROTECTED_SETTINGS %s PROTECTED_SETTINGS",jsonencode(var.VM_EXTENSION_PROTECTED_SETTINGS))
    protected_settings = jsonencode(var.VM_EXTENSION_PROTECTED_SETTINGS)

    //depends_on = ["azurerm_virtual_machine.vm"]

    /*
    tags = {
        environment = "Production"
    } */
}