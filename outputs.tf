output "database_name_check" {
  value = var.database-name
  description = "Verify database name is being read correctly"
}

output "database_username_check" {
  value = var.database-username
  sensitive = true
  description = "Verify database username is being read correctly"
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
  description = "ALB DNS endpoint"
}
