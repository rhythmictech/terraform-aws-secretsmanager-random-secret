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
| description |  | string | `""` | no |
| length |  | number | n/a | yes |
| min\_special |  | number | `"0"` | no |
| name | Name \(omit to use name\_prefix\) | string | `""` | no |
| name\_prefix | Name Prefix \(not used if name specified\) | string | `"terraform"` | no |
| override\_special |  | string | `""` | no |
| pass\_version |  | number | `"1"` | no |
| special |  | bool | `"false"` | no |
| tags |  | map(string) | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| secret | Generated secret |
| secret\_arn | The ARN of the secret |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Warning
Secrets are generated using the random provider and are stored in the tfstate in plaintext.
