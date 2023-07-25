output "instance_security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.instance_security_group.id
}

output "instance_role_name" {
  description = "Friendly name of the role"
  value       = aws_iam_role.instance_role.name
}

output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.instance.id
}

output "instance_public_ip" {
  description = "The public IP address assigned to the instance"
  value       = aws_instance.instance.public_ip
}

output "instance_public_dns" {
  description = "The public DNS name assigned to the instance"
  value       = aws_instance.instance.public_dns
}
