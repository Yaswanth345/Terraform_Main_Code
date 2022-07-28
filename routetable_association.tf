#Route table association for public subnets

resource "aws_route_table_association" "public_routetable_association" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.terraform_public_routetable.id
}

#Route table association for private subnets

resource "aws_route_table_association" "private_routetable_association" {
    count = length(var.private_subnet_ip)
    subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
    route_table_id = aws_route_table.terraform_private_routetable.id
}