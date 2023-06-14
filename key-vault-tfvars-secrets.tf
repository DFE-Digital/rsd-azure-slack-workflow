module "azurerm_key_vault" {
  source = "github.com/DFE-Digital/terraform-azurerm-key-vault-tfvars?ref=v0.1.3"

  environment                           = local.environment
  project_name                          = local.project_name
  existing_resource_group               = module.azurerm_logic_app_workflow.resource_group.name
  azure_location                        = local.azure_location
  key_vault_access_users                = local.key_vault_access_users
  key_vault_access_ipv4                 = local.key_vault_access_ipv4
  tfvars_filename                       = local.tfvars_filename
  diagnostic_log_analytics_workspace_id = module.azurerm_logic_app_workflow.azurerm_log_analytics_workspace.id

  tags = local.tags
}
