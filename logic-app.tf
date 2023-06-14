module "azurerm_logic_app_workflow" {
  source              = "github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-slack?ref=v0.1.0"
  environment         = local.environment
  project_name        = local.project_name
  azure_location      = local.azure_location
  resource_group_bins = local.resource_group_bins

  tags = local.tags
}