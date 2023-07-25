resource "aws_instance" "instance" {
  ami           = var.instance_ami
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.instance_security_group.id]
  iam_instance_profile   = aws_iam_instance_profile.instance_profile.id

  monitoring = var.enabled_monitoring
  key_name   = var.key_name
  user_data  = data.template_file.main.rendered

  root_block_device {
    volume_size = var.instance_volume_size
    volume_type = var.instance_volume_type

    tags = merge(var.custom_tags, { Terraform = "true" })
  }

  metadata_options {
    http_endpoint               = var.http_endpoint
    http_put_response_hop_limit = var.http_put_response_hop_limit
    http_tokens                 = var.http_tokens
    instance_metadata_tags      = var.instance_metadata_tags
  }

  tags = merge(var.custom_tags, { Terraform = "true" })
}
