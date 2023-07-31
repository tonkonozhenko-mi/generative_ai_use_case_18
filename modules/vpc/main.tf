resource "aws_vpc" "main" {
  cidr_block = var.cidr

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnets

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = each.key

  tags = {
    Name = "${var.vpc_name}_public_${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnets

  vpc_id     = aws_vpc.main.id
  cidr_block = each.value
  availability_zone = each.key

  tags = {
    Name = "${var.vpc_name}_private_${each.key}"
  }
}

# Output the VPC ID and Subnet IDs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_ids" {
  value = { for subnet in aws_subnet.public : subnet.availability_zone => subnet.id }
}

output "private_subnet_ids" {
  value = { for subnet in aws_subnet.private : subnet.availability_zone => subnet.id }
}
