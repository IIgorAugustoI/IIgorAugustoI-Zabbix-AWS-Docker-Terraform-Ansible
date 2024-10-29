terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.region_aws
}

resource "aws_key_pair" "chaveSSH" {
  key_name   = var.chave
  public_key = file("${var.chave}.pub")
}

resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.instancia
  key_name      = aws_key_pair.chaveSSH.key_name
  tags = {
    Name = var.aplication_name
  }
  user_data = file("docker.sh")
}
