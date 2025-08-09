# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get a default subnet in a specific AZ
data "aws_subnet" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = [var.az]
  }
}

# Create EC2 instance
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnet.default_subnet.id

  tags = {
    Name        = "${var.environment}-ec2"
    Environment = var.environment
  }
}