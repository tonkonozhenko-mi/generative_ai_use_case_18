variable "ami" {
  description = "The ID of the AMI to use for the instances"
  type        = string
}

variable "instance_type" {
  description = "The instance type to use for the instances"
  type        = string
}

variable "instances" {
  description = "A map of instance names to subnet IDs"
  type        = map(string)
}
