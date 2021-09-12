# terraform-aws-existing-vpc

Terraform module which load vpc detail info

## Usage

```hcl
module "vpc" {
    source = "../../"

    vpc_id = "vpc id"
    filters = {
        subnet = {
            "cidr-block": ["10.0.0.1/24"]
        }
    }
}
```

## variables

### vpc-id

variable which load existing vpc detail info

### filter

vpc details filter

* [subnet](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSubnets.html)
  * availability-zone - The Availability Zone for the subnet. You can also use availabilityZone as the filter name.
  * availability-zone-id - The ID of the Availability Zone for the subnet. You can also use availabilityZoneId as the filter name.
  * available-ip-address-count - The number of IPv4 addresses in the subnet that are available.
  * cidr-block - The IPv4 CIDR block of the subnet. The CIDR block you specify must exactly match the subnet's CIDR block for information to be returned for the subnet. You can also use cidr or cidrBlock as the filter names.
  * default-for-az - Indicates whether this is the default subnet for the Availability Zone. You can also use defaultForAz as the filter name.
  * ipv6-cidr-block-association.ipv6-cidr-block - An IPv6 CIDR block associated with the subnet.
  * ipv6-cidr-block-association.association-id - An association ID for an IPv6 CIDR block associated with the subnet.
  * ipv6-cidr-block-association.state - The state of an IPv6 CIDR block associated with the subnet.
  * outpost-arn - The Amazon Resource Name (ARN) of the Outpost.
  * owner-id - The ID of the AWS account that owns the subnet.
  * state - The state of the subnet (pending | available).
  * subnet-arn - The Amazon Resource Name (ARN) of the subnet.
  * subnet-id - The ID of the subnet.
  * tag:\<key\> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key Owner and the value TeamA, specify tag:Owner for the filter name and TeamA for the filter value.
  * tag-key - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.
  * vpc-id - The ID of the VPC for the subnet.
