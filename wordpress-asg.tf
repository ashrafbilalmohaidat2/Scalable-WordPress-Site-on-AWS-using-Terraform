resource "aws_autoscaling_group" "wordpress-asg" {
  name                      = var.wordpress-autoscaling-group
  max_size                  = 2
  min_size                  = 1
  desired_capacity          = 2
  launch_template {
    id      = aws_launch_template.lunch-template.id
    version = "$Latest"
  }
  vpc_zone_identifier       = [aws_subnet.private-subnet-1.id, aws_subnet.private-subnet-2.id]
  target_group_arns        = [aws_lb_target_group.target-group-app.arn]
  health_check_type        = "ELB"
  health_check_grace_period = 300
}

resource "aws_sns_topic" "asg_notifications" {
  name = "asg-notifications"
}

resource "aws_sns_topic_subscription" "email" {
  topic_arn = aws_sns_topic.asg_notifications.arn
  protocol  = "email"
  endpoint  = "ashrafbilal2002@gmail.com"
}

resource "aws_autoscaling_notification" "asg_notifications" {
  group_names = [aws_autoscaling_group.wordpress-asg.id]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR"
  ]

  topic_arn = aws_sns_topic.asg_notifications.arn
}