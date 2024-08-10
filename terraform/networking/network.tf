variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet" {}
variable "availability_zone" {}


resource "aws_vpc" "prp-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = var.vpc_name
    }
}

resource "aws_subnet" "prp-subnet" {
    count = length(var.public_subnet)
    vpc_id = aws_vpc.prp-vpc.id
    cidr_block = element(var.public_subnet, count.index)
    availability_zone = element(var.availability_zone, count.index)
    map_public_ip_on_launch = true
    tags = {
      Name = "Public-Subnet-${var.vpc_name}"
    }
}
resource "aws_internet_gateway" "prp-gateway" {
    vpc_id = aws_vpc.prp-vpc.id
}

resource "aws_route_table" "prp-rt" {
    vpc_id = aws_vpc.prp-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.prp-gateway.id
    }
}
resource "aws_route_table_association" "prp-RTAssociation" {
    count = length(var.public_subnet)
    subnet_id = aws_subnet.prp-subnet[count.index].id
    route_table_id = aws_route_table.prp-rt.id
}


output "vpc_id" {
    value = aws_vpc.prp-vpc.id
}
output "subnet_id_0" {
    value = aws_subnet.prp-subnet[0].id
  
}
output "subnet_id_1" {
    value = aws_subnet.prp-subnet[1].id
  
}
output "availability_zones" {
  value = var.availability_zone  
}