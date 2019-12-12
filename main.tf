terraform {
  required_providers {
    random = ">= 2.2.0"
  }
}

resource "random_password" "random_string" {
  length           = var.length
  special          = var.special
  min_special      = var.min_special
  override_special = var.override_special

  keepers = {
    pass_version = var.pass_version
  }
}

resource "aws_secretsmanager_secret" "secret" {
  description = var.description
  name        = var.name == "" ? null : var.name
  name_prefix = var.name == "" ? var.name_prefix : null
  tags        = var.tags
}

resource "aws_secretsmanager_secret_version" "secret_val" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = random_password.random_string.result
}
