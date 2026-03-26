resource "aws_db_subnet_group" "subnet-grp" {
  name       = var.database-group
  subnet_ids = [aws_subnet.db-subnet1.id,aws_subnet.db-subnet2.id]

  tags = {
    Name = var.database-group
  }
}