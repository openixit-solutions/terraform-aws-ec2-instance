resource "aws_cloudwatch_log_group" "instance_log_group" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = var.cloudwatch_log_group_retention

  tags = merge(var.custom_tags, { Terraform = "true" })
}
