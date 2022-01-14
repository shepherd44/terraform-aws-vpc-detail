output "id" {
    depends_on = [
      data.aws_vpc.vpc
    ]
    value = data.aws_vpc.vpc.id
    description = "vpc id"
}

output "arn" {
    depends_on = [
      data.aws_vpc.vpc
    ]
    value = data.aws_vpc.vpc.arn
    description = "vpc arn"
}

output "cidr_block" {
    depends_on = [
      data.aws_vpc.vpc
    ]
    value = data.aws_vpc.vpc.cidr_block
    description = "vpc cidr block"
}

output "subnets" {
    depends_on = [
      data.aws_subnet.subnets
    ]
    value = [
        # for subnet in data.aws_subnet.subnets: subnet
        for subnet in data.aws_subnet.subnets: {
            id = subnet.id
            arn = subnet.arn
            cidr_block = subnet.cidr_block
            state = subnet.state
            owner_id = subnet.owner_id
            vpc_id = subnet.vpc_id
            availability_zone = subnet.availability_zone
            availability_zone_id = subnet.availability_zone_id
            available_ip_address_count = subnet.available_ip_address_count
            tags = subnet.tags
        }
    ]
}

# output "subnets" {
#     depends_on = [
#       data.aws_subnet.subnets
#     ]
#     value = data.aws_subnet.subnets
# }

output "security-groups" {
    depends_on = [
        data.aws_security_group.security_groups
    ]
    value = [
        for item in data.aws_security_group.security_groups: {
            id = item.id
            arn = item.arn
            tags = item.tags
        }
    ]
}
