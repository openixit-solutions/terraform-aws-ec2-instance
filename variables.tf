variable "region" {
  description = "Region for the resources"
  type        = string
}

variable "client" {
  description = "Client Name for the resources"
  type        = string
}

variable "environment" {
  description = "Environment of the project"
  type        = string
}

variable "project" {
  description = "Name of the project"
  type        = string
}

variable "instance_ami" {
  description = "AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance"
  type        = string
}

variable "enabled_monitoring" {
  description = "If true, the launched EC2 instance will have detailed monitoring enabled"
  type        = bool
  default     = false
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
}

variable "instance_volume_size" {
  description = "Size of the volume in gibibytes (GiB)"
  type        = number
  default     = 20
}

variable "instance_volume_type" {
  description = "Type of volume. Valid values include standard, gp2, gp3, io1, io2, sc1, or st1"
  type        = string
  default     = "gp2"
}

variable "instance_iam_role_name" {
  description = "The name of the instance role"
  type        = string
}

variable "instance_iam_profile_name" {
  description = "The name of the instance profile"
  type        = string
}

variable "cidr_block_ssh" {
  description = "List of CIDR blocks. Cannot be specified with source_security_group_id or self"
  type        = list(string)
  default     = null
}

variable "cloudwatch_log_group_name" {
  description = "The name of the log group. If omitted, Terraform will assign a random, unique name"
  type        = string
  default     = null
}

variable "cloudwatch_log_group_retention" {
  description = "Specifies the number of days you want to retain log events in the specified log group. Possible values are: 1, 3, 5, 7, 14, 30, 60, 90, 120, 150, 180, 365, 400, 545, 731, 1827, 3653, and 0. If you select 0, the events in the log group are always retained and never expire"
  type        = number
  default     = 14
}

variable "custom_tags" {
  description = "Module custom tags"
  type        = map(any)
}

variable "docker_version" {
  description = "Specifies docker engine version"
  type        = string
  default     = "23.0"
}

variable "enabled_eip" {
  description = "Enable or disable eip resource creation"
  type        = bool
  default     = true
}

variable "http_endpoint" {
  description = "Whether the metadata service is available. Valid values include enabled or disabled. Defaults to enabled"
  type        = string
  default     = "enabled"
}

variable "http_put_response_hop_limit" {
  description = "Desired HTTP PUT response hop limit for instance metadata requests. The larger the number, the further instance metadata requests can travel. Valid values are integer from 1 to 64. Defaults to 1"
  type        = number
  default     = 1
}

variable "http_tokens" {
  description = "Whether or not the metadata service requires session tokens, also referred to as Instance Metadata Service Version 2 (IMDSv2). Valid values include optional or required. Defaults to optional."
  type        = string
  default     = "optional"
}

variable "instance_metadata_tags" {
  description = "Enables or disables access to instance tags from the instance metadata service. Valid values include enabled or disabled. Defaults to disabled."
  type        = string
  default     = "disabled"
}
