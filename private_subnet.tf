#Creating Private Subnets for VPC

resource "aws_subnet" "private_subnet" {
    count = length(var.private_subnet_ip)
    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = element(var.private_subnet_ip, count.index)
    availability_zone = element(var.private_subnet_az, count.index)

    tags = {
      "Name" = "Terraform Private Subnet"
    }
}