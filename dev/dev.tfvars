provider "aws" {
  region = "ap-south-1" # Change if needed
}

# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get a default subnet from that VPC
data "aws_subnet" "default_subnet" {
  filter {
    name   = "vpc-id-default"
    values = vpc-0c6a3db25471fad1b
  }

  default_for_az = true
}

resource "aws_instance" "dev_instance" {
  ami           = "ami-0f918f7e67a3323f0"
  instance_type = "t2.micro"
  subnet_id     = "subnet-054149ba0a34cfe66"

  tags = {
    Name        = "dev-ec2"
    Environment = "dev"
  }
}