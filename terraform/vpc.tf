
# Create a custom VPC
resource "aws_vpc" "final-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    instance_tenancy = "default"
    tags = {
        "Name" = "final-vpc"
    }
}

data "aws_availability_zones" "available" {}


#Create two subnets
resource "aws_subnet" "final-subnet-1" {
    vpc_id = aws_vpc.final-vpc.id
    cidr_block = "10.0.1.0/24" 
    map_public_ip_on_launch = true
    availability_zone = data.aws_availability_zones.available.names
    tags = {
        "Name" = "final-subnet-1"
    }
}

resource "aws_subnet" "final-subnet-2" {
    vpc_id = aws_vpc.final-vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = true
    availability_zone = "us-east-2b"
    tags = {
        "Name" = data.aws_availability_zones.available.names
    }
}
