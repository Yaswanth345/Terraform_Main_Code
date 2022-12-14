#Creating VPC
resource "aws_vpc" "terraform_vpc" {

    cidr_block = var.vpc_cidr
    instance_tenancy = "default"
    enable_dns_hostnames = true

    tags = {
      "Name" = "Terraform VPC"
    }
}