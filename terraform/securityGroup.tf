#Create security group to attach to the subnet and vpc to allow incoming traffic

resource "aws_security_group" "final-security-group" {
    name = "final-security-group"
    description = "Allow incoming traffic to the vpc"
    vpc_id = aws_vpc.final-vpc.id
    ingress {
        description = "Inbound rule"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Inbound rule"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "Inbound rule"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}