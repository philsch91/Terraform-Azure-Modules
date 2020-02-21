# Azure Role Assignment

### Usage

```terraform
data "azurerm_resource_group" "main" {
    name = var.ARM_RESOURCE_GROUP_NAME
}

data "azurerm_storage_account" "main" {
    name                = "opsfileshare"
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.storage-account
    ]
}

data "azurerm_subscription" "current" {}

module "role-assignment" {
    source = "git::https://server/path/to/repo.git//arm-role-assignment"

    # required parameters
    ROLE_ASSIGNMENT_NAME            = data.azurerm_storage_account.main.name
    ROLE_ASSIGNMENT_SCOPE           = data.azurerm_subscription.primary.id
    ROLE_ASSIGNMENT_DEFINITION_ID   = "${data.azurerm_subscription.subscription.id}${data.azurerm_virtual_machine.vm.id}"
    ROLE_ASSIGNMENT_PRINCIPAL_ID    = data.azurerm_storage_account.main.id

    # optional parameters
    # none
}
```

```terraform
data "azurerm_resource_group" "main" {
    name = var.ARM_RESOURCE_GROUP_NAME
}

data "azurerm_virtual_machine" "main" {
    name                = var.VM_NAME
    #location            = var.VM_LOCATION
    resource_group_name = data.azurerm_resource_group.main.name

    depends_on = [
        module.virtualmachine
    ]
}

data "azurerm_subscription" "current" {}

data "azurerm_builtin_role_definition" "contributor" {
    name = "Contributor"
}

module "role-assignment" {
    source = "git::https://server/path/to/repo.git//arm-role-assignment"

    # required parameters
    ROLE_ASSIGNMENT_NAME            = data.azurerm_virtual_machine.main.name
    ROLE_ASSIGNMENT_SCOPE           = data.azurerm_subscription.primary.id
    ROLE_ASSIGNMENT_DEFINITION_ID   = "${data.azurerm_subscription.subscription.id}${data.azurerm_builtin_role_definition.contributor.id}"
    ROLE_ASSIGNMENT_PRINCIPAL_ID    = data.azurerm_virtual_machine.main.identity[0]["principal_id"]

    # optional parameters
    # none
}
```
