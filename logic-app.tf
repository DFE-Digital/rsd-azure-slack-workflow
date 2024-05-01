module "azurerm_logic_app_workflow" {
  source                         = "github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-slack?ref=v0.2.3"
  environment                    = local.environment
  project_name                   = local.project_name
  azure_location                 = local.azure_location
  resource_group_target_webhooks = local.resource_group_target_webhooks
  route_waf_logs                 = local.route_waf_logs
  waf_logs_channel_id            = local.waf_logs_channel_id
  waf_logs_webhook_url           = local.waf_logs_webhook_url

  tags = local.tags
}
