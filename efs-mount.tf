resource "aws_efs_mount_target" "efs-mount-1" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_subnet.private-subnet-1.id
  security_groups = [aws_security_group.efs-sg.id]
  depends_on = [aws_security_group.efs-sg]
}

resource "aws_efs_mount_target" "efs-mount-2" {
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = aws_subnet.private-subnet-2.id
  security_groups = [aws_security_group.efs-sg.id]
  depends_on = [aws_security_group.efs-sg]
}