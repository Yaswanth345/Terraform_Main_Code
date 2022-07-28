#Creating Nat Gateway

resource "aws_nat_gateway" "terraform_nat_gateway" {

    count = length(var.private_subnet_ip)
    subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
    connectivity_type = "private"

    tags = {
        Name = "Terraform Nat Gateway"
    }
  
}