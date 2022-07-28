#providrer.tf
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}

#VPC
variable "vpc_cidr" {}

#EC2 Instance
variable "amis" {}
variable "intance_environment" {}
variable "instance_private_ip" {}

#Public_subnet
variable "public_subnet_ip" {}
variable "public_subnet_az" {}

#private_subnet
variable "private_subnet_ip" {}
variable "private_subnet_az" {}

#Roue Table IP
variable "public_routetable_ip" {}
variable "private_routetable_ip" {}
# variable "" {}
# variable "" {}
# variable "" {}
# variable "" {}
# variable "" {}