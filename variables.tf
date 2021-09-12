variable "vpc_id" {
  type = string
  description = "existing vpc id"
}

variable "filters" {
  type = any
  default = {}
  description = <<-EOF
    subnet filter key\n
    * availability-zone - The Availability Zone for the subnet. You can also use availabilityZone as the filter name.\n
    * availability-zone-id - The ID of the Availability Zone for the subnet. You can also use availabilityZoneId as the filter name.\n
    * available-ip-address-count - The number of IPv4 addresses in the subnet that are available.\n
    * cidr-block - The IPv4 CIDR block of the subnet. The CIDR block you specify must exactly match the subnet's CIDR block for information to be returned for the subnet. You can also use cidr or cidrBlock as the filter names.\n
    * default-for-az - Indicates whether this is the default subnet for the Availability Zone. You can also use defaultForAz as the filter name.\n
    * ipv6-cidr-block-association.ipv6-cidr-block - An IPv6 CIDR block associated with the subnet.\n
    * ipv6-cidr-block-association.association-id - An association ID for an IPv6 CIDR block associated with the subnet.\n
    * ipv6-cidr-block-association.state - The state of an IPv6 CIDR block associated with the subnet.\n
    * outpost-arn - The Amazon Resource Name (ARN) of the Outpost.\n
    * owner-id - The ID of the AWS account that owns the subnet.\n
    * state - The state of the subnet (pending | available).\n
    * subnet-arn - The Amazon Resource Name (ARN) of the subnet.\n
    * subnet-id - The ID of the subnet.\n
    * tag:<key> - The key/value combination of a tag assigned to the resource. Use the tag key in the filter name and the tag value as the filter value. For example, to find all resources that have a tag with the key Owner and the value TeamA, specify tag:Owner for the filter name and TeamA for the filter value.\n
    * tag-key - The key of a tag assigned to the resource. Use this filter to find all resources assigned a tag with a specific key, regardless of the tag value.\n
    * vpc-id - The ID of the VPC for the subnet.\n
    example\n
    filters = {\n
      subnet = {\n
        "subnet-id": ["subnet_id"]\n
      }\n
    }\n
  EOF
}

variable "endpoint_list" {
    type = list(string)
    default = []
    description = <<-EOF
    aws service list \n
    com.amazonaws.<region>.<service>
    EOF
}