resource "aws_security_group" "database-sg" {
  name        = var.database-security-group-name
  description = "Security group for the RDS database"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    description      = "Allow MySQL traffic from app security group"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.app-sg.id]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.database-security-group-name
  }
}