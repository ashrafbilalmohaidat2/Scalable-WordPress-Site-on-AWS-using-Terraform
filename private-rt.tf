resource "aws_route_table" "private-rt1" {
  vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw1.id
    }
    tags = {
        Name = var.private-route-table-name
    }
}

resource "aws_route_table" "private-rt2" {
  vpc_id = aws_vpc.vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw2.id
    }
    tags = {
        Name = var.private-route-table-name
    }
}

resource "aws_route_table_association" "private-rt-association-1" {
  subnet_id      = aws_subnet.private-subnet-1.id
  route_table_id = aws_route_table.private-rt1.id
}

resource "aws_route_table_association" "private-rt-association-2" {
  subnet_id      = aws_subnet.private-subnet-2.id
  route_table_id = aws_route_table.private-rt2.id
}