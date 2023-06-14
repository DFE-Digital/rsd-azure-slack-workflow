locals {
  environment                    = var.environment
  project_name                   = var.project_name
  azure_location                 = var.azure_location
  resource_group_target_webhooks = var.resource_group_target_webhooks
  key_vault_access_users         = var.key_vault_access_users
  key_vault_access_ipv4          = var.key_vault_access_ipv4
  tfvars_filename                = var.tfvars_filename

  tags = var.tags
}
