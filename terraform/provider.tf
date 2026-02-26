provider "aws" {
  region = var.aws_region
}

terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "ecs-project/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
