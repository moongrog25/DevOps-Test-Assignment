resource "aws_security_group" "word_press" {
  name        = "word_press"
  description = "All traffic allow"
  vpc_id      = aws_vpc.word_press.id

  ingress {
    description = "Allow_all_in"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow_all_out"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = var.resource_names["sg_name"]
    owner = var.owner_name
  }
}