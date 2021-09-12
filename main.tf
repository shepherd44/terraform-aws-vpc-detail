data "aws_region" "current" {}

locals {
  vpc_id = var.vpc_id
}

data "aws_vpc" "vpc" {
  id = local.vpc_id
}

data "aws_subnets" "subnet_ids" {
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
    for_each = toset(data.aws_subnets.subnet_ids.ids)

    id = each.value
}
