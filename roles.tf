resource "aws_iam_role" "instance_role" {
  name               = var.instance_iam_role_name
  description        = "${var.client} ${var.project} ${title(var.environment)} Role"
  assume_role_policy = data.aws_iam_policy_document.assume_policy.json

  tags = merge(var.custom_tags, { Terraform = "true" })
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = var.instance_iam_profile_name
  role = aws_iam_role.instance_role.name
  path = "/${var.client}/${var.project}/${var.environment}/"

  tags = merge(var.custom_tags, { Terraform = "true" })
}

resource "aws_iam_policy" "instance_policy" {
  name        = "${var.instance_iam_role_name}_policy"
  description = "${title(var.client)} ${title(var.project)} ${title(var.environment)} Instance Policy"

  policy = data.aws_iam_policy_document.policy.json
}

resource "aws_iam_role_policy_attachment" "instance_role_policy_attachment" {
  role       = aws_iam_role.instance_role.name
  policy_arn = aws_iam_policy.instance_policy.arn
}
