resource "azurerm_virtual_machine_extension" "main" {
    name = var.VM_EXTENSION_NAME

    resource_group_name     = var.RESOURCE_GROUP_NAME
    location                = var.LOCATION_NAME
    virtual_machine_name    = var.VM_NAME
    
    //virtual_machine_id      = var.VM_ID 
    
    publisher            = "Microsoft.Azure.Extensions"
    type                 = "CustomScript"
    type_handler_version = "2.0"
    
    settings = <<SETTINGS
    {
        "commandToExecute": "${var.VM_EXTENSION_COMMAND}"
    }
    SETTINGS

    //depends_on = ["azurerm_virtual_machine.vm"]

    /*
    tags = {
        environment = "Production"
    } */
}