resource "aws_nat_gateway" "nat-gw1" {
    allocation_id = aws_eip.eip1.id
    subnet_id     = aws_subnet.public-subnet-1.id

    tags = {
        Name = var.nat-gateway-name
    }
    
    depends_on = [aws_internet_gateway.igw]
}

resource "aws_nat_gateway" "nat-gw2" {
    allocation_id = aws_eip.eip2.id
    subnet_id     = aws_subnet.public-subnet-2.id

    tags = {
        Name = var.nat-gateway-name
    }
    
    depends_on = [aws_internet_gateway.igw]
}