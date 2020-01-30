# terraform-aws-secretsmanager-random-secret

[![](https://github.com/rhythmictech/terraform-aws-secretsmanager-random-secret/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-aws-secretsmanager-random-secret/actions)

Generates and stores a random string in Secrets Manager.

Example:

```
module "random_password" {
  source            = "git::https://github.com/rhythmictech/terraform-aws-secretsmanager-secret"
  name_prefix       = "RDSPassword"
  description       = "RDS instance master password"
  length            = 20
  override_specials = "@#$%^*()-=_+[]{};<>?,./"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| cloudtrail\_log\_group | Cloudtrail Log Group name \(required if `enable\_secret\_access\_notification=true`\) | string | `"change_me"` | no |
| create\_secret | If true, this module does nothing \(since tf doesn't support conditional modules\) | bool | `"true"` | no |
| description | Description to add to Secret | string | `""` | no |
| enable\_secret\_access\_notification | Notify SNS topic on secret access \(not recommended for most use cases\) | bool | `"false"` | no |
| length | Length of string | number | n/a | yes |
| min\_lower | Minimum number of lower case characters | number | `"0"` | no |
| min\_numeric | Minimum number of numbers | number | `"0"` | no |
| min\_special | Minimum number of special characters | number | `"0"` | no |
| min\_upper | Minimum number of upper case characters | number | `"0"` | no |
| name | Name \(omit to use name\_prefix\) | string | `""` | no |
| name\_prefix | Name Prefix \(not used if name specified\) | string | `"terraform"` | no |
| override\_special |  | string | `""` | no |
| pass\_version | Password version. Increment this to trigger a new password. | number | `"1"` | no |
| secret\_access\_metric\_namespace | Metric namespace to use for CloudWatch metric | string | `"SecretsManager"` | no |
| secret\_access\_notification\_arn | SNS topic to notify on secret access \(required if `enable\_secret\_access\_notification=true`\) | string | `""` | no |
| tags | Tags to add to supported resources | map(string) | `{}` | no |
| use\_lower | Use lower case  characters | bool | `"true"` | no |
| use\_number | Use numbers | bool | `"true"` | no |
| use\_special | Use special characters | bool | `"true"` | no |
| use\_upper | Use upper case characters | bool | `"true"` | no |

## Outputs

| Name | Description |
|------|-------------|
| secret | Generated secret |
| secret\_arn | The ARN of the secret |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Warning
Secrets are generated using the random provider and are stored in the tfstate in plaintext.
