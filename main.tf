resource "aws_instance" "ec2" {
  ami = var.ami
  instance_type = var.instance_type
  key_name = var.key_pair
  subnet_id = var.subnet_id
  security_groups = [aws_security_group.sg.id]

  tags = {
    Name = var.ec2_name
  }
}