output "vpc_id" {
  description = "The ID of the created VPC"
  value       = module.vpc_main.vpc_id
}

output "public_subnets" {
  description = "Details of public subnets (name => { subnet_id, az })"
  value       = module.vpc_main.public_subnets
}

output "private_subnets" {
  description = "Details of private subnets (name => { subnet_id, az })"
  value       = module.vpc_main.private_subnets
}
