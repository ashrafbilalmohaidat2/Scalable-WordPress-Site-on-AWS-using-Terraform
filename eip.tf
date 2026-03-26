resource "aws_eip" "eip1" {
    domain = "vpc"
    
    tags = {
        Name = var.nat-eip-name[0]
    }
    
    depends_on = [aws_internet_gateway.igw]
}

resource "aws_eip" "eip2" {
    domain = "vpc"
    
    tags = {
        Name = var.nat-eip-name[1]
    }
    
    depends_on = [aws_internet_gateway.igw]
}