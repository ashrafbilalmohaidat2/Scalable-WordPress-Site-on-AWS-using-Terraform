resource "aws_security_group" "ssh-sg" {
  name        = var.ssh-security-group-name
  description = "Security group for SSH access to EC2 instances"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "Allow SSH traffic from ICE"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    security_groups  = [aws_security_group.ice-sg.id]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.ssh-security-group-name
  }
}