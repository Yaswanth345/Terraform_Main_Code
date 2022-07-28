#Provider
aws_access_key = "AKIAUZNCIU67YE7PBBO3"
aws_secret_key = "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"
aws_region = "ap-south-1"

#VPC
vpc_cidr = "10.1.0.0/16"

#EC2 Instance
amis = {
    ap-south-1 = "ami-068257025f72f470d"
    us-east-1 = "ami-0cff7528ff583bf9a"
}
#["ami-09de362f44ba0a166", "ami-0bb750956ea14aab6"]
intance_environment = "Prod"
instance_private_ip = "10.1.1.100"

#public_subnet
public_subnet_ip = "10.1.1.0/24"
public_subnet_az = "ap-south-1b"

#private_subnet
private_subnet_ip = ["10.1.10.0/24", "10.1.20.0/24" ]
private_subnet_az = ["ap-south-1b", "ap-south-1a"]

#Route table IP
public_routetable_ip = "0.0.0.0/0"
private_routetable_ip = "0.0.0.0/0"