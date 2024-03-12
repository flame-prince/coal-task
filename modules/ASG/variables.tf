variable "vpc_id" {
  description = "VPC ID for the security groups"
  type        = string
}

variable "subnet_ids" {
  description = "Subnet IDs for the ASG instances and ALB"
  type        = list(string)
}

variable "ami_id" {
  description = "AMI ID for the Red Hat Linux instances"
  type        = string
}

variable "key_name" {
  description = "Key name for SSH access to the instances"
  type        = string
}
