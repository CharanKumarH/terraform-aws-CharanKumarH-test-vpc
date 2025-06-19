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

```hcl
module "vpc" {
  source = "git::https://github.com/<your-org>/terraform-aws-vpc.git?ref=v1.0.0"

  vpc_config = {
    name       = "my-vpc"
    cidr_block = "10.0.0.0/16"
  }

  subnet_config = {
    public-1 = {
      Name       = "subnet-1"
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      public     = true
    },
    private-1 = {
      Name       = "subnet-2"
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
    }
  }
}
