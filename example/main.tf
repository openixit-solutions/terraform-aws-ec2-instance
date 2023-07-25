terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "instance" {
  source = "../"

  client      = "test-opx"
  environment = "test"
  region      = "us-west-2"
  project     = "test-project"

  instance_ami  = "ami-0a97be4c4be6d6cc4"
  instance_type = "t3.nano"
  key_name      = "oregon_openix_testing"

  cidr_block_ssh = ["0.0.0.0/0"]

  instance_iam_role_name    = "openix_sarasa_role"
  instance_iam_profile_name = "openix_sarasa_profile"
  cloudwatch_log_group_name = "/instance/openix/testing"

  custom_tags = {
    Name        = "openix"
    Environment = "test"
    Project     = "openix-test"
  }
}
