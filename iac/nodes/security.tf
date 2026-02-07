resource "aws_security_group" "node_sg" {
  vpc_id = var.vpc_id

  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "-1"
    cidr_blocks = ["10.0.0.0/16"]
  }
}
