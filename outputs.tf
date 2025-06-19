output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

locals {
  public_subnet_details = {
    for key, config in local.public_subnets : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }

  private_subnet_details = {
    for key, config in local.private_subnets : key => {
      subnet_id = aws_subnet.main[key].id
      az        = aws_subnet.main[key].availability_zone
    }
  }
}

output "public_subnets" {
  description = "Map of public subnet names to subnet IDs and AZs"
  value       = local.public_subnet_details
}

output "private_subnets" {
  description = "Map of private subnet names to subnet IDs and AZs"
  value       = local.private_subnet_details
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway (if created)"
  value       = length(aws_internet_gateway.igw) > 0 ? aws_internet_gateway.igw[0].id : null
}

output "public_route_table_id" {
  description = "The ID of the public route table (if created)"
  value       = length(aws_route_table.public) > 0 ? aws_route_table.public[0].id : null
}
