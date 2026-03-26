resource "aws_security_group" "efs-sg" {
    name        = var.efs-security-group-name
    description = "Security group for EFS file system"
    vpc_id      = aws_vpc.vpc.id
    
    ingress {
        description = "Allow NFS traffic from app instances"
        from_port   = 2049
        to_port     = 2049
        protocol    = "tcp"
        security_groups = [aws_security_group.app-sg.id]
    }

    ingress {
        description ="Allow SSH traffic from SSH security group"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        security_groups = [aws_security_group.ssh-sg.id]
    }

    egress {
        description = "Allow all outbound traffic"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = var.efs-security-group-name
    }
}