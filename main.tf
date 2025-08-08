# Get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Get the default subnet in a specific AZ
data "aws_subnet" "default_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "availability-zone"
    values = ["ap-south-1a"] # Change to your AZ if needed
  }
}

# Create EC2 instance in default VPC
resource "aws_instance" "dev_instance" {
  ami           = "ami-0f918f7e67a3323f0" # Replace with latest AMI
  instance_type = "t2.micro"
  subnet_id     = data.aws_subnet.default_subnet.id

  tags = {
    Name        = "Badhai-Ho"
    Environment = "dev"
  }
}