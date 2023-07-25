# terraform-aws-application-instance

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 4.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | ~> 4.0.0 |

## Modules

No modules.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_region"></a> [region](#input\_region) | Region for the resources | `string` | n/a | yes |
| <a name="input_client"></a> [client](#input\_client) | Client Name for the resources | `string` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment of the project | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Name of the project | `string` | n/a | yes |
| <a name="input_instance_ami"></a> [instance_ami](#input\_instance_ami) | AMI to use for the instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance | `string` | n/a | yes |
| <a name="input_enabled_monitoring"></a> [enabled_monitoring](#input\_enabled_monitoring) | If true, the launched EC2 instance will have detailed monitoring enabled | `bool` | `false` | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | Key name of the Key Pair to use for the instance | `string` | n/a | yes |
| <a name="input_instance_volume_size"></a> [instance\_volume\_size](#input\_instance\_volume\_size) | Size of the volume in gibibytes (GiB) | `number` | `20` | no |
| <a name="input_instance_volume_type"></a> [instance_volume_type](#input\_instance_volume_type) | Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1 | `string` | `gp2` | no |
| <a name="input_instance_iam_role_name"></a> [instance_iam_role_name](#input\_instance_iam_role_name) | The name of the instance role | `string` | null | no |
| <a name="input_instance_iam_profile_name"></a> [instance_iam_profile_name](#input\_instance_iam_profile_name) | The name of the instance profile | `string` | null | no |
| <a name="input_cidr_block_ssh"></a> [cidr\_block\_ssh](#input\_cidr\_block\_ssh) | CIDR for ssh security group rule | `list(string)` | n/a | yes |
| <a name="input_cloudwatch_log_group_name"></a> [cloudwatch_log_group_name](#input\_cloudwatch_log_group_name) | The name of the log group. If omitted, Terraform will assign a random, unique name | `string` | `null` | no |
| <a name="input_cloudwatch_log_group_retention"></a> [cloudwatch_log_group_retention](#input\_cloudwatch_log_group_retention) | Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire | `number` | `7` | no |
| <a name="input_docker_version"></a> [docker_version](#input\_docker_version) | Specifies docker engine version | `string` | `"23.0"` | no |
| <a name="input_enabled_eip"></a> [enabled_eip](#input\_enabled_eip) | Enable or disable eip resource creation | `bool` | `true` | no |
| <a name="input_http_endpoint"></a> [http_endpoint](#input\_http_endpoint) | Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled | `string` | `"enabled"` | no |
| <a name="input_http_put_response_hop_limit"></a> [http_put_response_hop_limit](#input\_http_put_response_hop_limit) | Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64. Defaults to 1 | `number` | `1` | no |
| <a name="input_http_tokens"></a> [http_tokens](#input\_http_tokens) | Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required. Defaults to optional. | `string` | `"optional"` | no |
| <a name="input_instance_metadata_tags"></a> [instance_metadata_tags](#input\_instance_metadata_tags) | Enables or disables access to instance tags from the instance metadata service. Valid values include enabled or disabled. Defaults to disabled. | `string` | `"disabled"` | no |
| <a name="input_custom_tags"></a> [custom_tags](#input\_custom_tags) | Module custom tags | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_instance_security_group_id"></a> [instance_security_group_id](#output\_instance_security_group_id) | ID of the security group |
| <a name="output_instance_role_name"></a> [instance_role_name](#output\_instance_role_name) | Friendly name of the role |
| <a name="output_instance_id"></a> [instance_id](#output\_instance_id) | The ID of the instance |
| <a name="output_instance_public_ip"></a> [instance_public_ip](#output\_instance_public_ip) | The public IP address assigned to the instance |
| <a name="output_instance_public_dns"></a> [instance_public_dns](#output\_instance_public_dns) | The public DNS name assigned to the instance |

## Aditional Referencies

- [get-docker](https://get.docker.com/)

<!-- END_TF_DOCS -->
