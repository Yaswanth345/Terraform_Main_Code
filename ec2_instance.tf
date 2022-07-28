#Creating Public EC2 Instances

resource "aws_instance" "public_instance" {

    ami = lookup(var.amis, var.aws_region, "us-east-1")
    count = var.intance_environment == "Dev" ? 3:1
    instance_type = "t2.micro"
    key_name = "Munbai_keypair_Terraform"
    subnet_id = aws_subnet.public_subnet.id
    vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
    associate_public_ip_address = true
    private_ip = var.instance_private_ip

    tags = {
      "Name" = "Public Instance Terraform"
      Environment = var.intance_environment
    }
  
}

#Creating Private EC2 Instances

# resource "aws_instance" "private_instance" {

#     count = length(var.amis)
#     ami = element(var.amis, count.index)
#     instance_type = "t2.micro"
#     key_name = "Munbai_keypair_Terraform"
#     subnet_id = element(aws_subnet.private_subnet.*.id, count.index)
#     vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
#     associate_public_ip_address = true

#     tags = {
#       "Name" = "Private Instance Terraform${count.index+1}"
#       Environment = var.intance_environment
#     }
  
# }