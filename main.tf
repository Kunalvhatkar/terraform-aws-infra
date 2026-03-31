resource "aws_vpc" "Terraweek-vpc" {
  cidr_block       = "10.0.0.0/16"

tags = {
    Name = "TerraWeek-VPC"
  }
}

resource "aws_subnet" "Terraweek-vpc-subnet" {
  vpc_id     = aws_vpc.Terraweek-vpc.id
  cidr_block = "10.0.1.0/24"
map_public_ip_on_launch = true

  tags = {
    Name = "TerraWeek-Public-Subnet"
  }
}

resource "aws_internet_gateway" "Terraweek-igw" {
  vpc_id = aws_vpc.Terraweek-vpc.id

  tags = {
    Name = "Terraweek-igw"
  }
}

resource "aws_route_table" "Terraweek-routetable" {
  vpc_id = aws_vpc.Terraweek-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Terraweek-igw.id
  }


  tags = {
    Name = "Terraweek_routetable"
  }
}

resource "aws_route_table_association" "Terraweek_association" {
  subnet_id      = aws_subnet.Terraweek-vpc-subnet.id   # Reference your subnet
  route_table_id = aws_route_table.Terraweek-routetable.id  # Reference your route table
}