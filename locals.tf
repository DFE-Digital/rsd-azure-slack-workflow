locals {
  environment                    = var.environment
  project_name                   = var.project_name
  azure_location                 = var.azure_location
  resource_group_target_webhooks = var.resource_group_target_webhooks
  key_vault_access_ipv4          = var.key_vault_access_ipv4
  tfvars_filename                = var.tfvars_filename
  route_waf_logs                 = var.route_waf_logs
  waf_logs_channel_id            = var.waf_logs_channel_id
  waf_logs_webhook_url           = var.waf_logs_webhook_url

  tags = var.tags
}
