# #Security Group
# resource "aws_security_group" "terraform_sg" {

#     name = "Terraform Security Group"
#     description = "Allows All SSH"
#     vpc_id = aws_vpc.terraform_vpc.id

#     ingress = [ {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "Allow SsH"
#       from_port = 0
#       ipv6_cidr_blocks = [ "::/0" ]
#       prefix_list_ids = [ "pl-0419ec9f6f614c525" ]
#       protocol = "-1"
#       security_groups = [ "value" ]
#       self = false
#       to_port = 0
#     } ]

#     egress = [ {
#       cidr_blocks = [ "0.0.0.0/0" ]
#       description = "value"
#       from_port = 0
#       ipv6_cidr_blocks = [ "::/0" ]
#       prefix_list_ids = [ "pl-0419ec9f6f614c525" ]
#       protocol = "-1"
#       security_groups = [ "value" ]
#       self = false
#       to_port = 0
#     } ]
  
# }

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.terraform_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "ssh from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "ssh from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    #ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

