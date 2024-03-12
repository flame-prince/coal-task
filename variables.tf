variable "ami_id" {
  description = "The AMI ID for the EC2 instances"
}

variable "key_name" {
  description = "The key name to use for the instances for SSH access"
}

variable "instance_type" {
  description = "The instance type of the EC2 instance"
  type        = string
}

variable "instance_name" {
  description = "The name of the EC2 instance"
  type        = string
}

variable "volume_size" {
  description = "The size of the volume in gigabytes"
}

variable "ssh_access_cidr" {
  description = "CIDR block for SSH access to the EC2 instance"
  type        = string
}

variable "cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_subnets" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "availability_zones" {
  description = "A list of availability zones in the region"
  type        = list(string)
}

variable "region" {
  description = "The AWS region"
  type        = string
}
