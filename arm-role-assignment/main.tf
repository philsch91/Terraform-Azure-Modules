resource "azurerm_role_assignment" "example" {
    name               = var.ROLE_ASSIGNMENT_NAME
    scope              = var.ROLE_ASSIGNMENT_SCOPE
    #role_definition_id = "${data.azurerm_subscription.subscription.id}${data.azurerm_builtin_role_definition.contributor.id}"
    role_definition_id = var.ROLE_ASSIGNMENT_DEFINITION_ID
    principal_id       = var.ROLE_ASSIGNMENT_PRINCIPAL_ID
}