resource "aws_security_group" "ice-sg" {
  name        = var.ice-security-group-name
  description = "Security group for Instance Connect Endpoint"
  vpc_id      = aws_vpc.vpc.id

  egress {
    description      = "Allow ssh outbound traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.vpc-cidr-block]
  } 
}