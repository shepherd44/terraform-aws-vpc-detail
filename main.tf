data "aws_region" "current" {}

locals {
  vpc_id = var.vpc_id
}

data "aws_vpc" "vpc" {
  id = local.vpc_id
}

# load subnets
locals {
    is_load_subnet = lookup(var.filters, "subnet", true) != false ? true : false
    subnet_filter = lookup(var.filters, "subnet", false) != false ? keys(var.filters["subnet"]) : []
}
data "aws_subnets" "subnet_ids" {
    count = local.is_load_subnet ? 1 : 0
    filter {
        name = "vpc-id"
        values = [local.vpc_id]
    }

    dynamic filter {
        for_each = lookup(var.filters, "subnet", false) != false ? keys(var.filters["subnet"]) : []
        content {
            name = filter.value
            values = var.filters["subnet"][filter.value]
        }
    }
}

data "aws_subnet" "subnets" {
    for_each = local.is_load_subnet ? toset(data.aws_subnets.subnet_ids[0].ids) : toset([])

    id = each.value
}

# load security groups
locals {
    is_load_sg = lookup(var.filters, "security-group", false) != false ? true : false
    security_groups_filter = lookup(var.filters, "security-group", false) != false ? keys(var.filters["security-group"]) : []
}
data "aws_security_groups" "security_groups" {
    count = local.is_load_sg ? 1 : 0
    filter {
        name = "vpc-id"
        values = [local.vpc_id]
    }

    dynamic filter {
        for_each = lookup(var.filters, "security-group", false) != false ? keys(var.filters["security-group"]) : []
        content {
            name = filter.value
            values = var.filters["security-group"][filter.value]
        }
    }
}

data "aws_security_group" "security_groups" {
    for_each = local.is_load_sg ? toset(data.aws_security_groups.security_groups[0].ids) : toset([])

    id = each.value
}
