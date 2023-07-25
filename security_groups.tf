resource "aws_security_group" "instance_security_group" {
  description = "Default security group of the instance"

  tags = merge(var.custom_tags, { Terraform = "true" })
}

resource "aws_security_group_rule" "inbound_traffic_http" {
  description       = "inbound http traffic"
  security_group_id = aws_security_group.instance_security_group.id

  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_traffic_https" {
  description       = "inbound https traffic"
  security_group_id = aws_security_group.instance_security_group.id

  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "inbound_traffic_ssh" {
  description       = "inbound ssh traffic"
  security_group_id = aws_security_group.instance_security_group.id

  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = var.cidr_block_ssh
}

resource "aws_security_group_rule" "outbound_traffic_instance" {
  description       = "outbound traffic"
  security_group_id = aws_security_group.instance_security_group.id

  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = -1
  cidr_blocks = ["0.0.0.0/0"]
}
