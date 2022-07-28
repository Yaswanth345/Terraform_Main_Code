#Creating Route table for public subnets

resource "aws_route_table" "terraform_public_routetable" {
    
    vpc_id = aws_vpc.terraform_vpc.id

    route {
        cidr_block = var.public_routetable_ip
        gateway_id = aws_internet_gateway.terraform_igw.id
    }

    tags = {
      "Name" = "Public Subnet Association"
    }
}


#Creating Route table for private subnets

resource "aws_route_table" "terraform_private_routetable" {
    
    vpc_id = aws_vpc.terraform_vpc.id

    route {
        cidr_block = var.private_routetable_ip
        nat_gateway_id = "${aws_nat_gateway.terraform_nat_gateway[0].id}"
    }


    tags = {
      "Name" = "Private Subnet Association"
    }
}