terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_key_pair" "mykeypair" {
  key_name = "my-keypair"
  public_key = file("my-key.pub")
}

resource "aws_instance" "myinstance" {
  ami = "ami-0447a12f28fddb066"
  instance_type = "t2.micro"
  key_name = aws_key_pair.mykeypair.key_name

  tags = {
    Name = "my-2-instance"
  }
}
