variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "A map of availability zones to CIDR blocks for the public subnets"
  type        = map(string)
}

variable "private_subnets" {
  description = "A map of availability zones to CIDR blocks for the private subnets"
  type        = map(string)
}
