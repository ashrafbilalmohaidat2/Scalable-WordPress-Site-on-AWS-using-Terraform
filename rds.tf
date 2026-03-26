resource "aws_db_instance" "rds-db" {
    allocated_storage    = 10
    storage_type         = "gp2"
    engine               = "mysql"
    engine_version       = "8.0"
    instance_class       = "db.t3.micro"
    db_name              = var.database-name
    username             = var.database-username
    password             = var.database-password
    parameter_group_name = "default.mysql8.0"
    skip_final_snapshot  = true
    publicly_accessible    = false
    multi_az               = false         
    db_subnet_group_name  = aws_db_subnet_group.subnet-grp.name
    vpc_security_group_ids = [aws_security_group.database-sg.id]
    tags = {
        Name = var.database-group
    }
}