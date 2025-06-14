output "instance_id" {
  value = aws_instance.web[*].id
}

output "public_ip" {
  value = aws_instance.web[*].public_ip
}
#aws_vpc
#aws_internet_gateway
#aws_subnet
#aws_route_table
#aws_route_table_association
#aws_security_group
#accesing on http
