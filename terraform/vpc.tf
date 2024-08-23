resource "aws_vpc" "word_press" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name  = var.resource_names["vpc_name"]
    owner = var.owner_name
  }
}

resource "aws_subnet" "word_press" {
  vpc_id                  = aws_vpc.word_press.id
  cidr_block              = var.subnet_cidr
  availability_zone       = var.availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name  = var.resource_names["subnet_name"]
    owner = var.owner_name
  }
}

resource "aws_internet_gateway" "word_press" {
  vpc_id = aws_vpc.word_press.id

  tags = {
    Name  = var.resource_names["IGW_name"]
    owner = var.owner_name
  }
}

resource "aws_default_route_table" "word_press" {
  default_route_table_id = aws_vpc.word_press.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.word_press.id
  }

  tags = {
    Name  = var.resource_names["rtb_name"]
    owner = var.owner_name
  }
}

resource "aws_route_table_association" "word_press" {
  subnet_id      = aws_subnet.word_press.id
  route_table_id = aws_default_route_table.word_press.id
}
