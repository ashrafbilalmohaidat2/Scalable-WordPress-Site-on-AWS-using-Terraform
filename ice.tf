resource "aws_ec2_instance_connect_endpoint" "ice_endpoint" {
  subnet_id          = aws_subnet.private-subnet-1.id
  security_group_ids = [aws_security_group.ice-sg.id]
}