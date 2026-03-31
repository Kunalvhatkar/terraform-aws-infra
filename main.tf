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

resource "aws_security_group" "Terraweek-SG"{

  name        = "Terraweek-SG"
  description = "Allow SSH AND HTTP traffic"
  vpc_id      = aws_vpc.Terraweek-vpc.id

# ingress

# SSH (Port 22)
  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP (Port 80)
  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraweek-SG"
  }

}

resource "aws_instance" "Terraweek_ec2instance" {
  ami           = "ami-0931307dcdc2a28c9"
  instance_type = "t3.micro"
  subnet_id                   = aws_subnet.Terraweek-vpc-subnet.id
  vpc_security_group_ids      = [aws_security_group.Terraweek-SG.id]
  associate_public_ip_address = true

  tags = {
    Name = "Terraweek-Server"
  }
}