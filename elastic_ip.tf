resource "aws_eip" "elastic_ip" {
  count = var.enabled_eip ? 1 : 0

  instance = aws_instance.instance.id
  vpc      = true
}
