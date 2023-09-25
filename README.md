# rsd-azure-front-door-waf
Azure Front Door WAF for RSD

[![Terraform CI](https://github.com/DFE-Digital/rsd-azure-front-door-waf/actions/workflows/continuous-integration-terraform.yml/badge.svg?branch=main)](https://github.com/DFE-Digital/rsd-azure-front-door-waf/actions/workflows/continuous-integration-terraform.yml/?branch=main)
[![Tflint](https://github.com/DFE-Digital/rsd-azure-front-door-waf/actions/workflows/continuous-integration-tflint.yml/badge.svg?branch=main)](https://github.com/DFE-Digital/rsd-azure-front-door-waf/actions/workflows/continuous-integration-tflint.yml?branch=main)
[![Tfsec](https://github.com/DFE-Digital/rsd-azure-front-door-waf/actions/workflows/continuous-integration-tfsec.yml/badge.svg?branch=main)](https://github.com/DFE-Digital/rsd-azure-front-door-waf/actions/workflows/continuous-integration-tfsec.yml?branch=main)

#### Configuring the storage backend

The Terraform state is stored remotely in Azure, this allows multiple team members to
make changes and means the state file is backed up. The state file contains
sensitive information so access to it should be restricted, and it should be stored
encrypted at rest.

##### Create a new storage backend

This step only needs to be done once per environment.
If it has already been created, obtain the storage backend attributes and skip to the next step.

The [Azure tutorial](https://docs.microsoft.com/en-us/azure/developer/terraform/store-state-in-azure-storage) outlines the steps to create a storage account and container for the state file. You will need:

- subscription_id: The id of the azure Subscription the resource group belongs to
- resource_group_name: The name of the resource group used for the Azure Storage account.
- storage_account_name: The name of the Azure Storage account.
- container_name: The name of the blob container.
- key: The name of the state store file to be created.

##### Create a backend configuration file

Create a new file named `backend.vars` with the following content:

```
subscription_id      = [the ID of the Azure subscription]
resource_group_name  = [the name of the Azure resource group]
storage_account_name = [the name of the Azure Storage account]
container_name       = [the name of the blob container]
key                  = "terraform.tstate"
```

#### Azure resources

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >= 3.51.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_azurerm_key_vault"></a> [azurerm\_key\_vault](#module\_azurerm\_key\_vault) | github.com/DFE-Digital/terraform-azurerm-key-vault-tfvars | v0.1.3 |
| <a name="module_azurerm_logic_app_workflow"></a> [azurerm\_logic\_app\_workflow](#module\_azurerm\_logic\_app\_workflow) | github.com/DFE-Digital/terraform-azurerm-logic-app-workflow-slack | v0.1.4 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_azure_location"></a> [azure\_location](#input\_azure\_location) | Azure location in which to launch resources. | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment name. Will be used along with `project_name` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_key_vault_access_ipv4"></a> [key\_vault\_access\_ipv4](#input\_key\_vault\_access\_ipv4) | A list of IPv4 Addresses that are allowed to connect to the Key Vault | `list(string)` | `[]` | no |
| <a name="input_key_vault_access_users"></a> [key\_vault\_access\_users](#input\_key\_vault\_access\_users) | A list of Active Directory user objects that should be permitted to access the Key Vault that the tfvars are stored in | `list(string)` | `[]` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project name. Will be used along with `environment` as a prefix for all resources. | `string` | n/a | yes |
| <a name="input_resource_group_target_webhooks"></a> [resource\_group\_target\_webhooks](#input\_resource\_group\_target\_webhooks) | Slack webhook destinations keyed by the Resource Group you want to collect webhooks from | <pre>map(<br>    object({<br>      webhook_url = string<br>      channel_id  = string<br>    })<br>  )</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to be applied to all resources | `map(string)` | n/a | yes |
| <a name="input_tfvars_filename"></a> [tfvars\_filename](#input\_tfvars\_filename) | Name of the Terraform var file you want to push to Key Vault | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
