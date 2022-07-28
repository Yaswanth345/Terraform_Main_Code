#Creating Public subnets for VPC

resource "aws_subnet" "public_subnet" {

    vpc_id = aws_vpc.terraform_vpc.id
    cidr_block = var.public_subnet_ip
    availability_zone = var.public_subnet_az

    tags = {
      "Name" = "Terraform public subnet"
    }
  
}