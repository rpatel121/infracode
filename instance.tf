resource "aws_instance" "web-server" {
  ami                         = data.aws_ami.ubuntu-linux-1804.id
  instance_type               = var.web_instance_type
  subnet_id                   = aws_subnet.public-subnet.id
  vpc_security_group_ids      = [aws_security_group.aws-web-sg.id]
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = var.web_key_pair
  
  # root disk
  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  # data disk
  ebs_block_device {
    device_name           = "/dev/xvda"
    volume_size           = "50"
    volume_type           = "gp2"
    encrypted             = true
    delete_on_termination = true
  }
  
  tags = {
    Name        = "kopicloud-dev-web-server"
    Environment = "dev"
  }
}
