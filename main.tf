
provider "aws" {
  region = var.default_region
  shared_credentials_files = var.credentials_path
  profile = var.profile_name
}

####
#Creating a VPC for this exercies

resource "aws_vpc" "vpc" {

    cidr_block = var.vpc_cidr

    tags = {

        Name = "Project2-Practice-vpc"

        Project = "Project2"

        ManagedBy = "terraform"
    
    }

}



##This will create a public and private subnet for each availability zone
#Using the cidrsubnet() function, it will automatically divide our cidrblock for the subnets. 

resource "aws_subnet" "public" {

    for_each = var.public_subnet_numbers

    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

    vpc_id = aws_vpc.vpc.id

    availability_zone = each.key

     tags = {

        Name = "Project2-Practice-public-subnet"

        Project = "Project2"

        ManagedBy = "terraform"

        Subnet = "${each.key}-${each.value}"
    
    }
  
}


resource "aws_subnet" "private" {

    for_each = var.private_subnet_numbers

    cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value)

    vpc_id = aws_vpc.vpc.id

     tags = {

        Name = "Project2-Practice-private-subnet"

        Project = "Project2"

        ManagedBy = "terraform"

        Subnet = "${each.key}-${each.value}"
    
    }
  
}