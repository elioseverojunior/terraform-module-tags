# AWS Resource Tagging

[![Terratest for Terraform](https://github.com/elioseverojunior/terraform-module-tags/actions/workflows/main.yml/badge.svg)](https://github.com/elioseverojunior/terraform-module-tags/actions/workflows/main.yml)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application"></a> [application](#input\_application) | Application Name | `string` | n/a | yes |
| <a name="input_business_owner"></a> [business\_owner](#input\_business\_owner) | Which business unit owns the resource? This is used for cost analysis and support. | `string` | `"digital"` | no |
| <a name="input_country"></a> [country](#input\_country) | Country Name. Which country owns the resource? This is used for cost analysis and support. | `string` | n/a | yes |
| <a name="input_customer_facing"></a> [customer\_facing](#input\_customer\_facing) | Is this resource customer facing? Knowing this will help us drive decisions that may need to be made with short notice. | `bool` | `false` | no |
| <a name="input_customer_impacting"></a> [customer\_impacting](#input\_customer\_impacting) | Is this resource customer impacting? Leave as "false" until criteria are better defined or you are positive it is customer impacting. | `bool` | `false` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment Name. Which runtime owns the resource? This is used for cost analysis and support. | `string` | n/a | yes |
| <a name="input_iac_source"></a> [iac\_source](#input\_iac\_source) | IAC location of resource. This helps us know exactly where the code is that manages the IAC resource | `string` | n/a | yes |
| <a name="input_iac_type"></a> [iac\_type](#input\_iac\_type) | IAC type for resource? This helps us know how the resource was created | `string` | `"TF"` | no |
| <a name="input_pillar"></a> [pillar](#input\_pillar) | If “digital” is the business\_owner then what pillar owns the resource? This is used for cost analysis and support. | `string` | n/a | yes |
| <a name="input_tags_override"></a> [tags\_override](#input\_tags\_override) | Additional Tags. It should be used whenever we want extend override tags standards with new or existing tags. | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_tags"></a> [tags](#output\_tags) | AWS Resource Tagging |
