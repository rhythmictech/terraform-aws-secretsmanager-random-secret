
locals {
  common_tags = {
    env       = var.env
    owner     = var.owner
    namespace = var.namespace
  }
}

resource "random_string" "random_string" {
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
  name_prefix = var.name_prefix

  tags = merge(
    local.common_tags,
    var.additional_tags
  )
}

resource "aws_secretsmanager_secret_version" "secret_val" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = random_string.random_string.result
}
