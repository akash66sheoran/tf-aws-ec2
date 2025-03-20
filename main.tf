resource "aws_instance" "ec2" {
  for_each = var.instances
  ami = each.value.ami
  instance_type = each.value.instance_type
  key_name = each.value.key_name
  subnet_id = each.value.subnet_id
  security_groups = [aws_security_group.sg.id]
  root_block_device {
    volume_size = each.value.root_block_device.volume_size
    volume_type = each.value.root_block_device.volume_type
  }
  ebs_block_device {
    device_name = each.value.ebs_block_device.device_name
    volume_size = each.value.ebs_block_device.volume_size
    volume_type = each.value.ebs_block_device.volume_type
  }

  tags = {
    Name = each.key
  }
}