resource "aws_instance" "instance" {
  for_each = var.instances

  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = each.value

  tags = {
    Name = each.key
  }
}

# Output the Instance IDs
output "instance_ids" {
  value = { for instance in aws_instance.instance : instance.tags.Name => instance.id }
}
