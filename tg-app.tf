resource "aws_lb_target_group" "target-group-app" {
    target_type = "instance"
    name     = var.alb-target-group
    port     = 80
    protocol = "HTTP"
    vpc_id   = aws_vpc.vpc.id
    
    health_check {
      enabled             = true
      healthy_threshold   = 2
      unhealthy_threshold = 3
      timeout             = 5
      interval            = 30
      path                = "/health.php"
      matcher             = "200"
    }
}

resource "aws_lb_listener" "alb-listener-app" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "alb-listener-https" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:316759592209:certificate/51ed80e3-12ad-4565-a1af-26c4f3c8b8bc"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.target-group-app.arn
  }
}