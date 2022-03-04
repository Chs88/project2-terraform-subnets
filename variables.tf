variable "default_region" {

    description = "The region we are working in."

}

variable "credentials_path" {

    description = "The path to the aws credentials so terraform can find and authenticate it"
}

variable "profile_name" {

    description = "The profile name for the aws configuration"
  
}

##Assigning numbers to the availability zones to later use for creating the subnets dynamically
##This will also help in assigning IP addresses

variable "public_subnet_numbers" {
    
    type = map(number)

    description = "Map of availability zones to a number that should be used for public subnets"

    default = {

      "eu-west-2a" = 1

      "eu-west-2b" = 2

      "eu-west-2c" = 3

    }
}

variable "private_subnet_numbers" {
    
    type = map(number)

    description = "Map of availability zones to a number that should be used for public subnets"
    default = {

      "eu-west-2a" = 4

      "eu-west-2b" = 5

      "eu-west-2c" = 6

    }
}

variable "vpc_cidr" {

    description = "The ip addresses for the vpc"

    default = "10.0.0.0/17"
}