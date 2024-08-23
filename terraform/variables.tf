variable "vpc_cidr" {
  default     = "172.30.0.0/16"
  description = "cidr for vpc"
}

variable "subnet_cidr" {
  default     = "172.30.1.0/24"
  description = "cidr for subnet"
}

variable "availability_zone" {
  default     = "eu-central-1a"
  description = "AZ for subnet"
}

variable "instance" {
  description = "Instance config"
  type        = map(any)
  default = {
    "ami"           = "ami-04e601abe3e1a910f"
    "instance_type" = "t2.micro"
    "key_name"      = "aws_ed25519"
    "volume_size"   = 8 # in gibibytes (GiB)
    "volume_type"   = "gp2"
  }
}


####Tags
variable "resource_names" {
  description = "Value of the Name tag for the EC2 instance"
  type        = map(any)
  default = {
    "instance_name" = "word_press"
    "vpc_name"      = "vpc-raketa-vpn"
    "subnet_name"   = "subnet-raketa-vpn"
    "IGW_name"      = "IGW-raketa-vpn"
    "rtb_name"      = "route-table-raketa-vpn"
    "sg_name"       = "security-group-raketa-vpn"
  }
}

variable "owner_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "pronchenko"
}

