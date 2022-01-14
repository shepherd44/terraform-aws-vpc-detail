# terraform-aws-existing-vpc

Terraform module which load vpc detail info

## Usage

```hcl
module "vpc" {
    source  = "shepherd44/vpc-detail/aws"

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

default load

* subnet: load
* security-group: not load

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
* [security-group](https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeSecurityGroups.html):
  * description - The description of the security group.
  * egress.ip-permission.cidr - An IPv4 CIDR block for an outbound security group rule.
  * egress.ip-permission.from-port - For an outbound rule, the start of port range for the TCP and UDP protocols, or an ICMP type number.
  * egress.ip-permission.group-id - The ID of a security group that has been referenced in an outbound security group rule.
  * egress.ip-permission.group-name - The name of a security group that is referenced in an outbound security group rule.
  * egress.ip-permission.ipv6-cidr - An IPv6 CIDR block for an outbound security group rule.
  * egress.ip-permission.prefix-list-id - The ID of a prefix list to which a security group rule allows outbound access.
  * egress.ip-permission.protocol - The IP protocol for an outbound security group rule (tcp | udp | icmp, a protocol number, or -1 for all protocols).
  * egress.ip-permission.to-port - For an outbound rule, the end of port range for the TCP and UDP protocols, or an ICMP code.
  * egress.ip-permission.user-id - The ID of an AWS account that has been referenced in an outbound security group rule.
  * group-id - The ID of the security group.
  * group-name - The name of the security group.
  * ip-permission.cidr - An IPv4 CIDR block for an inbound security group rule.
  * ip-permission.from-port - For an inbound rule, the start of port range for the TCP and UDP protocols, or an ICMP type number.
  * ip-permission.group-id - The ID of a security group that has been referenced in an inbound security group rule.
  * ip-permission.group-name - The name of a security group that is referenced in an inbound security group rule.
  * ip-permission.ipv6-cidr - An IPv6 CIDR block for an inbound security group rule.
  * ip-permission.prefix-list-id - The ID of a prefix list from which a security group rule allows inbound access.
  * ip-permission.protocol - The IP protocol for an inbound security group rule (tcp | udp | icmp, a protocol number, or -1 for all protocols).
  * ip-permission.to-port - For an inbound rule, the end of port range for the TCP and UDP protocols, or an ICMP code.
  * ip-permission.user-id - The ID of an AWS account that has been referenced in an inbound security group rule.
  * owner-id - The AWS account ID of the owner of the security group.
  * tag:<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key Owner and the value TeamA, specify tag:Owner for the filter name and TeamA for the filter value.
  * tag-key - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.
  * vpc-id - The ID of the VPC specified when the security group was created.
