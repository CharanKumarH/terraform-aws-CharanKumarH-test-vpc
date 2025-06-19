# Complete Example: VPC with Public and Private Subnets

This is a complete example showing how to use the `terraform-aws-vpc` module.

---

## Usage

```hcl
provider "aws" {
  region = "ap-south-1"
}

module "vpc_main" {
  source = "../../" # or use "git::https://github.com/<your-org>/terraform-aws-vpc.git?ref=v1.0.0"

  vpc_config = {
    name       = "my-vpc-2"
    cidr_block = "10.0.0.0/16"
  }

  subnet_config = {
    public_subnet = {
      Name       = "subnet-1"
      cidr_block = "10.0.1.0/24"
      az         = "ap-south-1a"
      public     = true
    },
    private_subnet = {
      Name       = "subnet-2"
      cidr_block = "10.0.2.0/24"
      az         = "ap-south-1b"
    }
  }
}
