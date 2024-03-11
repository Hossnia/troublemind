resource "aws_route_table" "main" {
  vpc_id = aws_vpc.utc-app1.id

  tags = {
    Name = "main-route-table"
  }
}

resource "aws_route" "public_subnet_route" {
  route_table_id         = aws_route_table.main.id
  destination_cidr_block = "0.0.0.0/0"  # Route all traffic to the internet gateway
  gateway_id             = aws_internet_gateway.dev-wdp-IGW.id
}

resource "aws_route_table_association" "public_subnet1_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "public_subnet2_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "private_subnet1_association" {
  subnet_id      = aws_subnet.private_subnet1.id
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table_association" "private_subnet2_association" {
  subnet_id      = aws_subnet.private_subnet2.id
  route_table_id = aws_route_table.main.id
}
