resource "aws_alb" "alb" {
  name = var.alb-name
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.alb-sg.id]
  subnets = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
}