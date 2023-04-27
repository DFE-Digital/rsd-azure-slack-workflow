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

variable "resource_group_bins" {
  description = "Slack webhook destinations keyed by the Resource Group you want to collect webhooks from"
  type = map(
    object({
      slack_webhook_url = string
      channel_id        = string
    })
  )
  sensitive = true
}
