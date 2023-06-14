module "azurerm_logic_app_workflow" {
  source                         = "github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-slack?ref=v0.1.3"
  environment                    = local.environment
  project_name                   = local.project_name
  azure_location                 = local.azure_location
  resource_group_target_webhooks = local.resource_group_target_webhooks

  tags = local.tags
}