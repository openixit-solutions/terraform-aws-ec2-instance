data "template_file" "main" {
  template = file("${path.module}/user_data.sh")

  vars = {
    docker_version = var.docker_version
    log_group      = var.cloudwatch_log_group_name
    region         = var.region
  }
}

data "aws_iam_policy_document" "assume_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "policy" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    resources = [
      "${aws_cloudwatch_log_group.instance_log_group.arn}*"
    ]
  }
}
