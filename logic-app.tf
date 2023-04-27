module "azurerm_logic_app_workflow" {
  source         = "github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-slack"
  environment    = local.environment
  project_name   = local.project_name
  azure_location = local.azure_location

  tags = local.tags
}