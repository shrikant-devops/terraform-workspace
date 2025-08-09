variable "region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2"
  type        = string
}

variable "az" {
  description = "Availability Zone"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}