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
  description = "Slack webhook destinations keyed by the Resource Group you want to collect webhooks from"
  type = map(
    object({
      webhook_url      = string
      channel_id       = string
      sev1_channel_id  = optional(string, "")
      sev1_webhook_url = optional(string, "")
    })
  )
  sensitive = true
}

variable "key_vault_access_users" {
  description = "A list of Active Directory user objects that should be permitted to access the Key Vault that the tfvars are stored in"
  default     = []
  type        = list(string)
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
