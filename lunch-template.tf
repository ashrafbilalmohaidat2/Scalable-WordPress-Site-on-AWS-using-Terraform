resource "aws_launch_template" "lunch-template" {
    depends_on = [aws_db_instance.rds-db, aws_efs_file_system.efs]
    name   = var.lunch-template-app[0]
    image_id      = var.image-id
    instance_type = var.instance-type
    
    network_interfaces {
      device_index = 0
      associate_public_ip_address = false
      security_groups = [aws_security_group.app-sg.id]
    }

    user_data = base64encode(templatefile("${path.module}/user-data.sh", {
      efs_dns = aws_efs_file_system.efs.dns_name
      db_name = var.database-name
      db_user = var.database-username
      db_pass = var.database-password
      db_host = aws_db_instance.rds-db.address
    }))

    tag_specifications {
        resource_type = "instance"
    
        tags = {
        Name = "wordpress-app-instance"
        }
    }
}