resource "aws_efs_file_system" "efs" {
    creation_token = var.efs-name
    tags = {
        Name = var.efs-name
    }
  
}