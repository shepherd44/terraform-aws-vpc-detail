provider "aws" {
    region = "ap-northeast-2"
}

data "aws_vpcs" "vpc_ids" {}

module "vpc" {
    source = "../../"

    vpc_id = tolist(data.aws_vpcs.vpc_ids.ids)[0]
}
