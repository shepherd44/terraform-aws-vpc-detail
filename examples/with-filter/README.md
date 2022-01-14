# Complete Example

```hcl
provider "aws" {}

module "vpc" {
    source  = "shepherd44/vpc-detail/aws"

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

output "vpc" {
    value = module.vpc
}
```

## Usage

```bash
terraform init
terraform plan
terraform apply
```
