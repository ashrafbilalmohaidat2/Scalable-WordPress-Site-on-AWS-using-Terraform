resource "aws_security_group" "app-sg" {
  name        = var.app-security-group-name
  description = "Security group for EC2 instances in the private subnet"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "Allow HTTP traffic from ALB security group"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb-sg.id]
  }

  ingress {
    description      = "Allow HTTPS traffic from ALB security group"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    security_groups  = [aws_security_group.alb-sg.id]
  }

  ingress {
    description      = "Allow SSH traffic from SSH security group"
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
    Name = var.app-security-group-name
  }
}