vpc_id        = "vpc-0e2e6b5c94514a787"
sg_name       = "tod-sg"
already_existing_role = "my-ec2-role"  # pass this value if you already have an existing role and you don't want to create a new role
ec2_role_name = "" # if the value of already_existing_role is not provided, then a new role will be created with this name

instances = {
  server = {
    ami           = "ami-0e449927258d45bc4"
    instance_type = "t2.micro"
    key_name      = "linux-key"
    subnet_id     = "subnet-05f86265cf120e43e"
    root_block_device = {
      volume_size = 8
      volume_type = "gp3"
    }
    tags = {Project = "TOD"}
  }
}

sg_inbound_rules = {
  allow_ssh_1 = {
    cidr_ipv4   = "192.168.0.0/16"
    from_port   = 22
    ip_protocol = "tcp"
    to_port     = 22
  }
  allow_ssh_2 = {
    cidr_ipv4   = "10.0.0.0/8"
    from_port   = 22
    ip_protocol = "tcp"
    to_port     = 22
  }
  allow_ssh_3 = {
    cidr_ipv4   = "172.0.0.0/8"
    from_port   = 22
    ip_protocol = "tcp"
    to_port     = 22
  }
}

sg_outbound_rules = {
  "allow_all_ipv4" = {
    cidr_ipv4   = "0.0.0.0/0"
    from_port   = 0
    ip_protocol = "-1"
    to_port     = 0
  }
  "allow_all_ipv6" = {
    cidr_ipv6   = "::/0"
    from_port   = 0
    ip_protocol = "-1"
    to_port     = 0
  }
}

managed_policy_arns = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"]
