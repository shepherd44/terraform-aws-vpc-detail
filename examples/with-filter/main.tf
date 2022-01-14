provider "aws" {
    region = "ap-northeast-2"
}

data "aws_vpcs" "vpc_ids" {}

module "vpc-with-filter" {
    source = "../../"

    vpc_id = tolist(data.aws_vpcs.vpc_ids.ids)[0]

    filters = {
        subnet = {
            subnet-id = ["subnet-123456789"]
        }
        security-group = {
            group-id = ["sg-123456789"]
        }
    }
}

module "vpc-without-children" {
    source = "../../"

    vpc_id = tolist(data.aws_vpcs.vpc_ids.ids)[0]

    filters = {
        subnet = false
        security-group = false
    }
}
