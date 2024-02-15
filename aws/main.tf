terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 3.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "first-aws_instance" {
  ami = "ami-05df79205a8bf140e"
  instance_type = "t2.micro"

  tags = {
    Name = "FirstAWSInstance"
  }
}