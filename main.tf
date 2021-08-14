resource "aws_instance" "this" {
  ami           = var.ami 
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids = var.vpc_security_group_ids
  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      kms_key_id            = lookup(root_block_device.value, "kms_key_id", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
      tags                  = lookup(root_block_device.value, "tags", null)
    }
  }
  tags = var.tags
}