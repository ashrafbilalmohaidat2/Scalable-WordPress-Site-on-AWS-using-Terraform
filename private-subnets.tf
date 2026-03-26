resource "aws_subnet" "private-subnet-1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private-subnet-cidr-blocks[0]
    availability_zone = var.availability-zone[0]
    tags = {
        Name = var.private-subnet-names[0]
    }
}

resource "aws_subnet" "private-subnet-2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private-subnet-cidr-blocks[1]
    availability_zone = var.availability-zone[1]
    tags = {
        Name = var.private-subnet-names[1]
    }
}