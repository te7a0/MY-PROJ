resource "aws_instance" "bastion_ec2" {
  ami           = var.ami_id
  instance_type = var.instance_type

  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]

  key_name = var.key_name

  associate_public_ip_address = true

  tags = {
    Name = "bastion_ec2"
  }
user_data = templatefile("${path.module}/install.sh", {})
}
