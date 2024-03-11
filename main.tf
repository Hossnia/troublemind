resource "aws_vpc" "utc-app1" {
    instance_tenancy = "default"
    cidr_block = "172.120.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true   
    tags = {
         Name = "utc-app1"
         env = "dev"
         team = "wdp"
         created-by = "Eric" 
      }  
}

resource "aws_internet_gateway" "dev-wdp-IGW" {
    vpc_id = aws_vpc.utc-app1.id
    tags = {
        Name = "dev-wdp-IGW"
   }
}

resource "aws_subnet" "public_subnet1" {
    vpc_id = aws_vpc.utc-app1.id 
    cidr_block = "172.120.1.0/24"
    availability_zone = "us-east-1a"
}
resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.utc-app1.id 
    cidr_block = "172.120.2.0/24"
    availability_zone = "us-east-1b"
}

resource "aws_subnet" "private_subnet1" {
    vpc_id = aws_vpc.utc-app1.id 
    cidr_block = "172.120.6.0/24"
    availability_zone = "us-east-1a"
}

resource "aws_subnet" "private_subnet2" {
    vpc_id = aws_vpc.utc-app1.id 
    cidr_block = "172.120.5.0/24"
    availability_zone = "us-east-1b"
}


