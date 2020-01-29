terraform {
  required_providers {
    random = ">= 2.2.0"
  }
}

resource "random_password" "random_string" {
  length           = var.length
  lower            = var.use_lower
  number           = var.use_number
  min_lower        = var.min_lower
  min_numeric      = var.min_numeric
  min_special      = var.min_special
  min_upper        = var.min_upper
  override_special = var.override_special == "" ? null : var.override_special
  special          = var.use_special
  upper            = var.use_upper

  keepers = {
    pass_version = var.pass_version
  }
}

resource "aws_secretsmanager_secret" "secret" {
  name        = var.name == "" ? null : var.name
  name_prefix = var.name == "" ? var.name_prefix : null
  description = var.description
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "secret_val" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = random_password.random_string.result
}
