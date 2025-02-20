variable "azure_client_id" {
  description = "Service Principal Client ID"
  type        = string
}

variable "azure_client_secret" {
  description = "Service Principal Client Secret"
  type        = string
  sensitive   = true
}

variable "azure_tenant_id" {
  description = "Service Principal Tenant ID"
  type        = string
}

variable "azure_subscription_id" {
  description = "Service Principal Subscription ID"
  type        = string
}

variable "environment" {
  description = "Environment name. Will be used along with `project_name` as a prefix for all resources."
  type        = string
}

variable "project_name" {
  description = "Project name. Will be used along with `environment` as a prefix for all resources."
  type        = string
}

variable "azure_location" {
  description = "Azure location in which to launch resources."
  type        = string
}

variable "tags" {
  description = "Tags to be applied to all resources"
  type        = map(string)
}

variable "resource_group_target_webhooks" {
  description = <<DOC
  Slack webhook destinations keyed by the Resource Group you want to collect webhooks from.
  Include an optional override for sev1 alarms by populating 'sev1_channel_id' and 'sev1_webhook_url'.
  If 'message_tag' is populated, it will be included as the first message line in Slack. You can use this for tagging users
  DOC
  type = map(
    object({
      channel_id        = string
      webhook_url       = string
      message_tag       = optional(string, "<!here>")
      error_channel_id  = optional(string, "")
      error_webhook_url = optional(string, "")
      error_message_tag = optional(string, "<!here>")
      sev1_channel_id   = optional(string, "")
      sev1_webhook_url  = optional(string, "")
      sev1_message_tag  = optional(string, "<!channel>")
    })
  )
  default   = {}
  sensitive = true
}

variable "key_vault_access_ipv4" {
  description = "A list of IPv4 Addresses that are allowed to connect to the Key Vault"
  default     = []
  type        = list(string)
}

variable "tfvars_filename" {
  description = "Name of the Terraform var file you want to push to Key Vault"
  type        = string
}

variable "route_waf_logs" {
  description = "Do you want to route WAF Logs to a separate Slack channel?"
  type        = bool
  default     = false
}

variable "waf_logs_channel_id" {
  description = "Slack webhook destination channel ID for WAF Logs"
  type        = string
  default     = ""
}

variable "waf_logs_webhook_url" {
  description = "Slack webhook URL for WAF Logs"
  type        = string
  default     = ""
  sensitive   = true
}
