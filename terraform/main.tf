terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  backend "http" {
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "word_press" {
  ami                    = var.instance["ami"]
  instance_type          = var.instance["instance_type"]
  key_name               = var.instance["key_name"]
  subnet_id              = aws_subnet.word_press.id
  vpc_security_group_ids = [aws_security_group.word_press.id]
  user_data              = "${file("init.sh")}"
  #   private_ip             = "172.30.1.91"
  
  root_block_device {
    delete_on_termination = true
    volume_size           = var.instance["volume_size"]
    volume_type           = var.instance["volume_type"]
    tags = {
      Name  = var.resource_names["instance_name"]
      owner = var.owner_name
    }
  }
  tags = {
    Name  = var.resource_names["instance_name"]
    owner = var.owner_name
  }
}

