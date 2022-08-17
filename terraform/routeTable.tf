#Create route table
resource "aws_route_table" "final-routeTable" {
    vpc_id = aws_vpc.final-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.final-gateway.id
    }
    tags = {
        "Name" = "final-routeTable"
    }
}

#Assign route table to both subnets in vpc
resource "aws_route_table_association" "terraform-subnet1-association" {
  subnet_id = aws_subnet.final-subnet-1.id
  route_table_id = aws_route_table.final-routeTable.id
}

resource "aws_route_table_association" "terraform-subnet2-association" {
  subnet_id = aws_subnet.final-subnet-2.id
  route_table_id = aws_route_table.final-routeTable.id
}

#Set the main route table association
resource "aws_main_route_table_association" "terraform-mainRT-association" {
  vpc_id = aws_vpc.final-vpc.id
  route_table_id = aws_route_table.final-routeTable.id
}

# create a internet gateway for vpc
resource "aws_internet_gateway" "final-gateway" {
    vpc_id = aws_vpc.final-vpc.id

    tags = {
        "Name" = "final-gateway"
    }
}