# terraform-aws-vpc

## Overview

This Terraform module creates an AWS VPC with a given CIDR block. It also provisions multiple subnets (both public and private). For public subnets, it configures an Internet Gateway (IGW) and sets up appropriate route tables and associations.

---

## Features

- Creates a VPC with a specified CIDR block  
- Creates public and private subnets  
- Creates an Internet Gateway (IGW) for public subnets (only if required)  
- Sets up route tables and associates them with public subnets  

---

## Usage
```
module "vpc" {
  source = "./module/vpc"

  vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "your_vpc_name"
  }
  subnet_config = {
    public_subnet = {
      cidr_block = "10.0.0.0/24"
      az         = "ap-south-1a"
      #To set the subnet as public, default is private
      public     = true
    }

    private_subnet = {
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1b"
    }
  }
}
```