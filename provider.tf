#Create VPC
resource "aws_vpc" "terraform-vpc" {
  cidr_block = 10.0.0.0/16
  enable_dns_hostnames = true
  instance_tenancy = "default"
  tags = {
    "Name" = "terraform-vpc"
  }
  
}